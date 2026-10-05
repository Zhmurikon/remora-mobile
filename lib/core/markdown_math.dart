import 'package:markdown/markdown.dart' as md;

/// Единый Markdown-парсер формул для теории и карточек.
///
/// Правила разделителей совпадают с веб-клиентом: `$…$` — строчная формула,
/// `$$…$$` — отдельный блок. Цены вида `5$ и $10` остаются обычным текстом.
md.Document mathMarkdownDocument() => md.Document(
  extensionSet: md.ExtensionSet.gitHubFlavored,
  blockSyntaxes: const [BlockMathSyntax()],
  inlineSyntaxes: [InlineMathSyntax()],
);

class InlineMathSyntax extends md.InlineSyntax {
  InlineMathSyntax() : super(r'\$(?=\S)((?:\\\$|[^$\n])+?)(?<=\S)\$(?!\d)');

  @override
  bool onMatch(md.InlineParser parser, Match match) {
    final tex = match[1]!.replaceAll(r'\$', r'$');
    parser.addNode(md.Element.text('math', tex));
    return true;
  }
}

class BlockMathSyntax extends md.BlockSyntax {
  const BlockMathSyntax();

  @override
  RegExp get pattern => RegExp(r'^\s*\$\$');

  @override
  md.Node parse(md.BlockParser parser) {
    final first = parser.current.content.trimLeft();

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
