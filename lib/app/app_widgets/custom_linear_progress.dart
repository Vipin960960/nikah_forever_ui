import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

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
          value: progress,
          color: AppColors.pink,
          backgroundColor: AppColors.greyLight,
          minHeight: 3,
        ),
      ),
    );
  }
}
