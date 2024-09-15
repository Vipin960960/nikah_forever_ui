import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import 'app_text_style.dart';

enum ChoiceStatus { active, inactive, error }

class ChoiceButton extends StatelessWidget {
  final String label;
  final ChoiceStatus status;
  final VoidCallback onPressed;

  const ChoiceButton(
      {super.key,
      required this.label,
      required this.onPressed,
      required this.status});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: status == ChoiceStatus.active
            ? AppColors.pink
            : AppColors.mainBackground,
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 4),
        side: BorderSide(
            color: status == ChoiceStatus.active
                ? AppColors.pink
                : status == ChoiceStatus.error
                    ? AppColors.red
                    : AppColors.greyLight,
            width: 1.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Text(
        label,
        style: AppTextStyle.bold(
            fontSize: 15,
            color: status == ChoiceStatus.active
                ? AppColors.white
                : AppColors.greyDark),
      ),
    );
  }
}
