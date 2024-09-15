import 'package:flutter/material.dart';

import '../constants/app_assets.dart';
import '../constants/app_colors.dart';
import 'app_text_style.dart';

enum StepStatus { active, inactive, complete }

class StepIndicator extends StatelessWidget {
  final StepStatus status;
  final int step;

  const StepIndicator({
    super.key,
    required this.status,
    required this.step,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: status != StepStatus.complete
          ? CircleAvatar(
              radius: 13,
              backgroundColor: status == StepStatus.active
                  ? AppColors.pink
                  : AppColors.greyLight,
              child: Center(
                child: CircleAvatar(
                  radius: 11,
                  backgroundColor: AppColors.white,
                  child: Text(
                    step.toString(),
                    style: AppTextStyle.custom(
                      fontSize: 12,
                      color: status == StepStatus.active
                          ? AppColors.pink
                          : AppColors.greyLight,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
            )
          : Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: AppColors.pink,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset(
                AppAssetsImage.tick,
                width: 14,
                color: AppColors.white,
              ),
            ),
    );
  }
}
