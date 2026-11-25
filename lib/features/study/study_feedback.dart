import 'package:flutter/material.dart';

import '../../app/theme.dart';

class StudyFeedback extends StatelessWidget {
  const StudyFeedback(this.message, {this.color, super.key});

  final String message;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        RemoraSpacing.sm,
        RemoraSpacing.xs,
        RemoraSpacing.sm,
        RemoraSpacing.md,
      ),
      child: Semantics(
        liveRegion: true,
        child: Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(color: color),
        ),
      ),
    );
  }
}
