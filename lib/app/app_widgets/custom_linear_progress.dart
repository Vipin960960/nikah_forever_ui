import 'package:flutter/material.dart';

class CustomLinearProgress extends StatelessWidget {
  final double progress;

  const CustomLinearProgress({
    super.key,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        child: LinearProgressIndicator(
          value: progress, // 50% progress
          color: Colors.pinkAccent,
          backgroundColor: Colors.grey[300],
          minHeight: 3,
        ),
      ),
    );
  }
}
