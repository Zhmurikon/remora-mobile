import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:markdown/markdown.dart' as md;

import '../../app/theme.dart';

/// Безопасный рендер теории статьи.
///
/// Повторяет серверный whitelist (`packages/ui/.../article-markdown.ts`):
/// markdown без сырого HTML, формулы `$…$` и `$$…$$`, изображения только по
/// протоколу `media:UUID`. Внешние ссылки в изображениях игнорируются —
/// как и на сервере, чтобы не утекал IP и не появлялись битые ссылки.
///
/// Рендер разнесён с извлечением: набор картинок определяет сервер, здесь —
/// только показ по готовой карте подписанных ссылок [mediaUrls] (id → url).
class ArticleContentWidget extends StatelessWidget {
  const ArticleContentWidget({
    super.key,
    required this.body,
    this.mediaUrls = const {},
  });

  final String body;

  /// Карта media id → подписанная ссылка.
  final Map<String, String> mediaUrls;

  @override
  Widget build(BuildContext context) {
    final document = md.Document(
      extensionSet: md.ExtensionSet.gitHubFlavored,
      blockSyntaxes: const [_BlockMathSyntax()],
      inlineSyntaxes: [_InlineMathSyntax()],
    );
    final nodes = document.parseLines(
      body.replaceAll('\r\n', '\n').split('\n'),
    );
    final renderer = _ArticleRenderer(context, mediaUrls);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: renderer.renderBlocks(nodes),
    );
  }
}

/// Обходит AST markdown и строит виджеты по блокам и inline-спанам.
class _ArticleRenderer {
  _ArticleRenderer(this.context, this.mediaUrls)
    : theme = Theme.of(context),
      isDark = Theme.of(context).brightness == Brightness.dark;

  final BuildContext context;
  final Map<String, String> mediaUrls;
  final ThemeData theme;
  final bool isDark;

  Color get _fg => isDark ? RemoraColors.darkFg : RemoraColors.lightFg;
  Color get _muted =>
      isDark ? RemoraColors.darkSurfaceMuted : RemoraColors.lightSurfaceMuted;
  Color get _border =>
      isDark ? RemoraColors.darkBorder : RemoraColors.lightBorder;
  Color get _accent =>
      isDark ? RemoraColors.darkPrimary : RemoraColors.lightPrimary;

  List<Widget> renderBlocks(List<md.Node> nodes) {
    final widgets = <Widget>[];
    for (final node in nodes) {
      final widget = _renderBlock(node);
      if (widget != null) {
        widgets.add(
          Padding(padding: const EdgeInsets.only(bottom: 12), child: widget),
        );
      }
    }
    return widgets;
  }

  Widget? _renderBlock(md.Node node) {
    if (node is md.Text) {
      final text = node.text.trim();
      return text.isEmpty ? null : Text(text, style: _bodyStyle());
    }
    if (node is! md.Element) return null;

    switch (node.tag) {
      case 'h1':
        return _heading(node, 26, FontWeight.w700);
      case 'h2':
        return _heading(node, 22, FontWeight.w700);
      case 'h3':
        return _heading(node, 19, FontWeight.w600);
      case 'h4':
      case 'h5':
      case 'h6':
        return _heading(node, 17, FontWeight.w600);
      case 'p':
        return _paragraph(node);
      case 'blockquote':
        return _blockquote(node);
      case 'ul':
        return _list(node, ordered: false);
      case 'ol':
        return _list(node, ordered: true);
      case 'pre':
        return _codeBlock(node);
      case 'hr':
        return Divider(color: _border, height: 1);
      case 'table':
        return _table(node);
      case 'mathBlock':
        return _mathBlock(node.textContent);
      case 'img':
        return _image(node);
      default:
        // Неизвестный блок — показываем как абзац из inline-детей.
        return _paragraph(node);
    }
  }

  TextStyle _bodyStyle() => TextStyle(fontSize: 16, height: 1.6, color: _fg);

  Widget _heading(md.Element node, double size, FontWeight weight) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Text.rich(
        TextSpan(children: _inline(node.children ?? [])),
        style: TextStyle(fontSize: size, fontWeight: weight, color: _fg),
      ),
    );
  }

  Widget _paragraph(md.Element node) {
    final children = node.children ?? [];
    // Абзац из единственного изображения — показываем крупно, без обёртки текста.
    if (children.length == 1) {
      final only = children.first;
      if (only is md.Element && only.tag == 'img') {
        return _image(only);
      }
    }
    return Text.rich(
      TextSpan(children: _inline(children)),
      style: _bodyStyle(),
    );
  }

  Widget _blockquote(md.Element node) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        border: Border(left: BorderSide(color: _accent, width: 3)),
        color: _muted.withValues(alpha: 0.4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: renderBlocks(node.children ?? []),
      ),
    );
  }

  Widget _list(md.Element node, {required bool ordered}) {
    final items = (node.children ?? []).whereType<md.Element>().toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var i = 0; i < items.length; i++)
          Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 24,
                  child: Text(ordered ? '${i + 1}.' : '•', style: _bodyStyle()),
                ),
                Expanded(child: _listItemContent(items[i])),
              ],
            ),
          ),
      ],
    );
  }

  Widget _listItemContent(md.Element li) {
    final children = li.children ?? [];
    // Вложенные списки/блоки внутри пункта рендерим как блоки, иначе — inline.
    final hasBlock = children.any(
      (c) => c is md.Element && _blockTags.contains(c.tag),
    );
    if (hasBlock) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (final c in children)
            if (c is md.Element && _blockTags.contains(c.tag))
              _renderBlock(c) ?? const SizedBox.shrink()
            else
              Text.rich(TextSpan(children: _inline([c])), style: _bodyStyle()),
        ],
      );
    }
    return Text.rich(
      TextSpan(children: _inline(children)),
      style: _bodyStyle(),
    );
  }

  static const _blockTags = {
    'ul',
    'ol',
    'pre',
    'blockquote',
    'table',
    'mathBlock',
    'p',
  };

  Widget _codeBlock(md.Element node) {
    // <pre><code class="language-xxx">…</code></pre>
    var code = node.textContent;
    var language = 'plaintext';
    final child = (node.children ?? []).whereType<md.Element>().firstOrNull;
    if (child != null && child.tag == 'code') {
      code = child.textContent;
      final cls = child.attributes['class'];
      if (cls != null && cls.startsWith('language-')) {
        language = cls.substring('language-'.length);
      }
    }
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: _muted,
        borderRadius: BorderRadius.circular(10),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: HighlightView(
          code.trimRight(),
          language: language,
          theme: isDark ? _darkCodeTheme : githubTheme,
          textStyle: const TextStyle(
            fontFamily: 'monospace',
            fontSize: 14,
            height: 1.4,
          ),
          tabSize: 2,
        ),
      ),
    );
  }

  Widget _mathBlock(String tex) {
    return Center(
      child: Math.tex(
        tex.trim(),
        mathStyle: MathStyle.display,
        textStyle: TextStyle(fontSize: 18, color: _fg),
        onErrorFallback: (_) => Text(tex, style: _bodyStyle()),
      ),
    );
  }

  Widget _table(md.Element node) {
    final rows = <TableRow>[];
    for (final section in node.children ?? <md.Node>[]) {
      if (section is! md.Element) continue;
      final isHead = section.tag == 'thead';
      for (final tr in section.children ?? <md.Node>[]) {
        if (tr is! md.Element || tr.tag != 'tr') continue;
        final cells = (tr.children ?? [])
            .whereType<md.Element>()
            .where((c) => c.tag == 'th' || c.tag == 'td')
            .map(
              (c) => Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                child: Text.rich(
                  TextSpan(children: _inline(c.children ?? [])),
                  style: _bodyStyle().copyWith(
                    fontWeight: isHead ? FontWeight.w600 : FontWeight.normal,
                  ),
                ),
              ),
            )
            .toList();
        rows.add(
          TableRow(
            decoration: isHead ? BoxDecoration(color: _muted) : null,
            children: cells,
          ),
        );
      }
    }
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: MediaQuery.of(context).size.width - 32,
        ),
        child: Table(
          defaultColumnWidth: const IntrinsicColumnWidth(),
          border: TableBorder.all(color: _border),
          children: rows,
        ),
      ),
    );
  }

  Widget _image(md.Element node) {
    final url = _resolveImage(node.attributes['src']);
    final alt = node.attributes['alt'] ?? '';
    if (url == null) {
      // Внешние ссылки отвергаются: показываем подпись, а не битую картинку.
      return alt.isEmpty
          ? const SizedBox.shrink()
          : Text(
              alt,
              style: _bodyStyle().copyWith(fontStyle: FontStyle.italic),
            );
    }
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: CachedNetworkImage(
        imageUrl: url,
        fit: BoxFit.contain,
        placeholder: (_, _) => Container(
          height: 120,
          alignment: Alignment.center,
          child: const CircularProgressIndicator(strokeWidth: 2),
        ),
        errorWidget: (_, _, _) => Container(
          height: 80,
          alignment: Alignment.center,
          child: Icon(
            Icons.broken_image_outlined,
            color: theme.colorScheme.outline,
          ),
        ),
      ),
    );
  }

  /// media:UUID → подписанная ссылка; всё остальное (http/data) отвергаем.
  String? _resolveImage(String? src) {
    if (src == null) return null;
    final value = src.trim();
    if (!value.toLowerCase().startsWith('media:')) return null;
    final id = value.substring(value.indexOf(':') + 1).toLowerCase();
    return mediaUrls[id];
  }

  // ── Inline ──

  List<InlineSpan> _inline(List<md.Node> nodes) {
    final spans = <InlineSpan>[];
    for (final node in nodes) {
      spans.addAll(_inlineNode(node));
    }
    return spans;
  }

  List<InlineSpan> _inlineNode(md.Node node) {
    if (node is md.Text) {
      return [TextSpan(text: node.text)];
    }
    if (node is! md.Element) return const [];

    switch (node.tag) {
      case 'strong':
        return [
          TextSpan(
            style: const TextStyle(fontWeight: FontWeight.w700),
            children: _inline(node.children ?? []),
          ),
        ];
      case 'em':
        return [
          TextSpan(
            style: const TextStyle(fontStyle: FontStyle.italic),
            children: _inline(node.children ?? []),
          ),
        ];
      case 'del':
        return [
          TextSpan(
            style: const TextStyle(decoration: TextDecoration.lineThrough),
            children: _inline(node.children ?? []),
          ),
        ];
      case 'code':
        return [
          TextSpan(
            text: node.textContent,
            style: TextStyle(
              fontFamily: 'monospace',
              fontSize: 14.5,
              backgroundColor: _muted,
              color: _fg,
            ),
          ),
        ];
      case 'a':
        return [
          TextSpan(
            style: TextStyle(
              color: _accent,
              decoration: TextDecoration.underline,
            ),
            children: _inline(node.children ?? []),
          ),
        ];
      case 'br':
        return const [TextSpan(text: '\n')];
      case 'img':
        return [
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: _image(node),
          ),
        ];
      case 'math':
        return [
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: Math.tex(
              node.textContent.trim(),
              mathStyle: MathStyle.text,
              textStyle: TextStyle(fontSize: 16, color: _fg),
              onErrorFallback: (_) =>
                  Text(node.textContent, style: _bodyStyle()),
            ),
          ),
        ];
      default:
        return _inline(node.children ?? []);
    }
  }

  static const _darkCodeTheme = <String, TextStyle>{
    'root': TextStyle(
      color: Color(0xFFF8F8F2),
      backgroundColor: Color(0xFF272822),
    ),
    'comment': TextStyle(color: Color(0xFF75715E)),
    'keyword': TextStyle(color: Color(0xFFF92672)),
    'string': TextStyle(color: Color(0xFFE6DB74)),
    'number': TextStyle(color: Color(0xFFAE81FF)),
    'built_in': TextStyle(color: Color(0xFF66D9EF)),
    'function': TextStyle(color: Color(0xFFA6E22E)),
    'title': TextStyle(color: Color(0xFFA6E22E)),
    'type': TextStyle(color: Color(0xFF66D9EF)),
    'literal': TextStyle(color: Color(0xFFAE81FF)),
    'operator': TextStyle(color: Color(0xFFF92672)),
  };
}

/// Строчная формула `$…$`. Правила разделителей — как на сервере: после
/// открывающего и перед закрывающим `$` не пробел, после закрывающего не цифра
/// (отсекает цены вида «5$ и $10»).
class _InlineMathSyntax extends md.InlineSyntax {
  _InlineMathSyntax() : super(r'\$(?=\S)((?:\\\$|[^$\n])+?)(?<=\S)\$(?!\d)');

  @override
  bool onMatch(md.InlineParser parser, Match match) {
    final tex = match[1]!.replaceAll(r'\$', r'$');
    parser.addNode(md.Element.text('math', tex));
    return true;
  }
}

/// Выключная формула `$$…$$` — один или несколько блоков строк.
class _BlockMathSyntax extends md.BlockSyntax {
  const _BlockMathSyntax();

  @override
  RegExp get pattern => RegExp(r'^\s*\$\$');

  @override
  md.Node parse(md.BlockParser parser) {
    final first = parser.current.content.trimLeft();

    // Одна строка: $$ … $$
    final single = RegExp(r'^\$\$(.+?)\$\$\s*$').firstMatch(first);
    if (single != null) {
      parser.advance();
      return md.Element.text('mathBlock', single.group(1)!.trim());
    }

    final lines = <String>[];
    final head = first.replaceFirst(RegExp(r'^\$\$'), '');
    if (head.trim().isNotEmpty) lines.add(head);
    parser.advance();

    while (!parser.isDone) {
      final content = parser.current.content;
      final closeIdx = content.indexOf(r'$$');
      if (closeIdx >= 0) {
        final before = content.substring(0, closeIdx);
        if (before.trim().isNotEmpty) lines.add(before);
        parser.advance();
        break;
      }
      lines.add(content);
      parser.advance();
    }
    return md.Element.text('mathBlock', lines.join('\n').trim());
  }
}
