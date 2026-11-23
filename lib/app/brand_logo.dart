import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'theme.dart';

const appDisplayName = 'Запоминальня';

/// Знак и наборное название из шапки сайта.
class ZapominalnyaLogo extends StatelessWidget {
  const ZapominalnyaLogo({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    final mark = Image.asset(
      dark ? 'assets/zapominalnya-ink.png' : 'assets/zapominalnya.png',
      color: dark ? RemoraColors.darkBrandInk : null,
      width: 40,
      height: 40,
      excludeFromSemantics: true,
    );

    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (MediaQuery.disableAnimationsOf(context))
            mark
          else
            TweenAnimationBuilder<double>(
              tween: Tween(begin: 0, end: 1),
              duration: const Duration(milliseconds: 560),
              child: mark,
              builder: (context, t, child) {
                final wave = math.sin(2 * math.pi * t) * math.sin(math.pi * t);
                return Transform.rotate(angle: -0.15 * wave, child: child);
              },
            ),
          const SizedBox(width: 7),
          Text(
            appDisplayName,
            style: TextStyle(
              color: dark
                  ? RemoraColors.darkBrandText
                  : RemoraColors.lightBrandText,
              fontFamily: 'NotoSerifDisplay',
              fontSize: 23,
              fontWeight: FontWeight.w400,
              letterSpacing: -0.8,
            ),
          ),
        ],
      ),
    );
  }
}
