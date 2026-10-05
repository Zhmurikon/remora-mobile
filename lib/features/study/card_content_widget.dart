import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:markdown/markdown.dart' as md;

import '../../app/theme.dart';
import '../../core/markdown_math.dart';

/// Рендерер содержимого стороны карточки.
///
/// Поддерживает три типа контента:
/// - text — обычный текст с переносами
/// - code — подсветка синтаксиса через flutter_highlight
/// - latex — формулы через flutter_math_fork
///
/// Опциональное изображение над текстом.
class CardContentWidget extends StatelessWidget {
  const CardContentWidget({
    super.key,
    required this.value,
    this.contentType = 'text',
    this.codeLanguage,
    this.imageUrl,
    this.fontSize = 20,
  });

  final String value;
  final String contentType;
  final String? codeLanguage;
  final String? imageUrl;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (imageUrl != null && imageUrl!.isNotEmpty) ...[
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: _buildImage(theme),
          ),
          const SizedBox(height: 16),
        ],
        _buildContent(context, isDark),
      ],
    );
  }

  Widget _buildImage(ThemeData theme) {
    final url = imageUrl!;
    final isLocal = url.startsWith('/');
    final isSvg =
        Uri.tryParse(url)?.path.toLowerCase().endsWith('.svg') ?? false;
    final placeholder = Container(
      height: 100,
      alignment: Alignment.center,
      child: const CircularProgressIndicator(strokeWidth: 2),
    );
    final error = Container(
      height: 60,
      alignment: Alignment.center,
      child: Icon(
        Icons.broken_image_outlined,
        size: 32,
        color: theme.colorScheme.outline,
      ),
    );
    if (isLocal) {
      return isSvg
          ? SvgPicture.file(
              File(url),
              fit: BoxFit.contain,
              placeholderBuilder: (_) => placeholder,
              errorBuilder: (_, _, _) => error,
            )
          : Image.file(
              File(url),
              fit: BoxFit.contain,
              errorBuilder: (_, _, _) => error,
            );
    }
    return isSvg
        ? SvgPicture.network(
            url,
            fit: BoxFit.contain,
            placeholderBuilder: (_) => placeholder,
            errorBuilder: (_, _, _) => error,
          )
        : CachedNetworkImage(
            imageUrl: url,
            fit: BoxFit.contain,
            maxHeightDiskCache: 512,
            placeholder: (_, _) => placeholder,
            errorWidget: (_, _, _) => error,
          );
  }

  Widget _buildContent(BuildContext context, bool isDark) {
    switch (contentType) {
      case 'code':
        return _buildCode(isDark);
      case 'latex':
        return _buildLatex(isDark);
      default:
        return _buildText(context, isDark);
    }
  }

  Widget _buildText(BuildContext context, bool isDark) {
    return _MixedTextContent(
      value: value,
      fontSize: fontSize,
      color: isDark ? RemoraColors.darkFg : RemoraColors.lightFg,
    );
  }

  Widget _buildCode(bool isDark) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark
            ? RemoraColors.darkSurfaceMuted
            : RemoraColors.lightSurfaceMuted,
        borderRadius: BorderRadius.circular(10),
      ),
      child: HighlightView(
        value,
        language: codeLanguage ?? 'plaintext',
        theme: isDark ? _darkCodeTheme : githubTheme,
        textStyle: TextStyle(
          fontSize: fontSize * 0.85,
          fontFamily: 'monospace',
          height: 1.4,
        ),
        tabSize: 4,
      ),
    );
  }

  Widget _buildLatex(bool isDark) {
    // Определяем display vs inline mode
    final isDisplay =
        value.contains(r'\[') ||
        value.contains(r'$$') ||
        (!value.contains(r'\(') && !value.contains(r'$'));

    // Убираем обёртки
    var tex = value
        .replaceAll(r'\[', '')
        .replaceAll(r'\]', '')
        .replaceAll(r'\(', '')
        .replaceAll(r'\)', '')
        .replaceAll(r'$$', '')
        .replaceAll(r'$', '')
        .trim();

    final fg = isDark ? RemoraColors.darkFg : RemoraColors.lightFg;

    if (isDisplay) {
      return Math.tex(
        tex,
        mathStyle: MathStyle.display,
        textStyle: TextStyle(fontSize: fontSize, color: fg),
        onErrorFallback: (error) => Text(
          value,
          style: TextStyle(fontSize: fontSize, color: fg),
          textAlign: TextAlign.center,
        ),
      );
    }
    return Math.tex(
      tex,
      mathStyle: MathStyle.text,
      textStyle: TextStyle(fontSize: fontSize, color: fg),
      onErrorFallback: (error) => Text(
        value,
        style: TextStyle(fontSize: fontSize, color: fg),
        textAlign: TextAlign.center,
      ),
    );
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
    'class': TextStyle(color: Color(0xFFA6E22E)),
    'params': TextStyle(color: Color(0xFFF8F8F2)),
    'meta': TextStyle(color: Color(0xFF75715E)),
    'title': TextStyle(color: Color(0xFFA6E22E)),
    'attribute': TextStyle(color: Color(0xFFA6E22E)),
    'symbol': TextStyle(color: Color(0xFFAE81FF)),
    'literal': TextStyle(color: Color(0xFFAE81FF)),
    'type': TextStyle(color: Color(0xFF66D9EF)),
    'regexp': TextStyle(color: Color(0xFFE6DB74)),
    'variable': TextStyle(color: Color(0xFFF8F8F2)),
    'operator': TextStyle(color: Color(0xFFF92672)),
    'punctuation': TextStyle(color: Color(0xFFF8F8F2)),
  };
}

/// Обычный текст карточки с безопасным Markdown и формулами `$…$` / `$$…$$`.
/// Изображение остаётся отдельным полем стороны карточки и строится выше.
class _MixedTextContent extends StatelessWidget {
  const _MixedTextContent({
    required this.value,
    required this.fontSize,
    required this.color,
  });

  final String value;
  final double fontSize;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final nodes = mathMarkdownDocument().parseLines(
      value.replaceAll('\r\n', '\n').split('\n'),
    );
    return SelectionArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (var index = 0; index < nodes.length; index++) ...[
            _block(nodes[index]),
            if (index < nodes.length - 1) const SizedBox(height: 12),
          ],
        ],
      ),
    );
  }

  TextStyle get _style =>
      TextStyle(fontSize: fontSize, height: 1.5, color: color);

  Widget _block(md.Node node) {
    if (node is md.Text) {
      return Text(node.text, style: _style, textAlign: TextAlign.center);
    }
    if (node is! md.Element) return const SizedBox.shrink();
    if (node.tag == 'mathBlock') {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Math.tex(
          node.textContent.trim(),
          mathStyle: MathStyle.display,
          textStyle: _style,
          onErrorFallback: (_) => Text(
            r'$$'
            '${node.textContent}'
            r'$$',
            style: _style,
            textAlign: TextAlign.center,
          ),
        ),
      );
    }
    if (node.tag == 'ul' || node.tag == 'ol') {
      final items = (node.children ?? []).whereType<md.Element>().toList();
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var index = 0; index < items.length; index++)
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    node.tag == 'ol' ? '${index + 1}. ' : '• ',
                    style: _style,
                  ),
                  Expanded(child: _inlineText(items[index].children ?? [])),
                ],
              ),
            ),
        ],
      );
    }
    return _inlineText(node.children ?? []);
  }

  Widget _inlineText(List<md.Node> nodes) => Text.rich(
    TextSpan(children: _inline(nodes)),
    style: _style,
    textAlign: TextAlign.center,
  );

  List<InlineSpan> _inline(List<md.Node> nodes) => [
    for (final node in nodes) ..._inlineNode(node),
  ];

  List<InlineSpan> _inlineNode(md.Node node) {
    if (node is md.Text) return [TextSpan(text: node.text)];
    if (node is! md.Element) return const [];
    switch (node.tag) {
      case 'math':
        return [
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: Math.tex(
              node.textContent.trim(),
              mathStyle: MathStyle.text,
              textStyle: _style,
              onErrorFallback: (_) =>
                  Text('\$${node.textContent}\$', style: _style),
            ),
          ),
        ];
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
            style: const TextStyle(fontFamily: 'monospace'),
          ),
        ];
      case 'br':
        return const [TextSpan(text: '\n')];
      default:
        return _inline(node.children ?? []);
    }
  }
}
