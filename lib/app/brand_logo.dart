import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RemoraLogo extends StatelessWidget {
  const RemoraLogo({super.key, this.width = 180});

  final double width;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Semantics(
      label: 'Remora',
      image: true,
      child: SvgPicture.asset(
        isDark
            ? 'assets/remora-logo-horizontal-inverse.svg'
            : 'assets/remora-logo-horizontal.svg',
        width: width,
        excludeFromSemantics: true,
      ),
    );
  }
}

class RemoraMark extends StatelessWidget {
  const RemoraMark({super.key, this.size = 80});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Remora',
      image: true,
      child: SvgPicture.asset(
        'assets/remora-mark.svg',
        width: size,
        height: size,
        excludeFromSemantics: true,
      ),
    );
  }
}
