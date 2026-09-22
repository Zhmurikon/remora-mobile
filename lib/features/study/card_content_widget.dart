import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';
import 'package:flutter_math_fork/flutter_math.dart';

import '../../app/theme.dart';

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
            child: CachedNetworkImage(
              imageUrl: imageUrl!,
              fit: BoxFit.contain,
              maxHeightDiskCache: 512,
              placeholder: (context, url) => Container(
                height: 100,
                alignment: Alignment.center,
                child: const CircularProgressIndicator(strokeWidth: 2),
              ),
              errorWidget: (context, url, error) => Container(
                height: 60,
                alignment: Alignment.center,
                child: Icon(
                  Icons.broken_image_outlined,
                  size: 32,
                  color: theme.colorScheme.outline,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
        _buildContent(context, isDark),
      ],
    );
  }

  Widget _buildContent(BuildContext context, bool isDark) {
    switch (contentType) {
      case 'code':
        return _buildCode(isDark);
      case 'latex':
        return _buildLatex(isDark);
      default:
        return _buildText();
    }
  }

  Widget _buildText() {
    return SelectableText(
      value,
      style: TextStyle(
        fontSize: fontSize,
        height: 1.5,
      ),
      textAlign: TextAlign.center,
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
    final isDisplay = value.contains(r'\[') ||
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
    'root': TextStyle(color: Color(0xFFF8F8F2), backgroundColor: Color(0xFF272822)),
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
