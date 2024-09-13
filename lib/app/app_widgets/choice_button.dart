import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import 'app_text_style.dart';

class ChoiceButton extends StatelessWidget {
  final String label;
  final bool isPressed;
  final VoidCallback onPressed;

  const ChoiceButton(
      {super.key,
      required this.label,
      required this.onPressed,
      required this.isPressed});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: isPressed ? AppColors.pink : AppColors.mainBackground,
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 4),
        side: BorderSide(
            color: isPressed ? AppColors.pink : AppColors.greyLight,
            width: 1.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Text(
        label,
        style: AppTextStyle.bold(
            fontSize: 15,
            color: isPressed ? AppColors.white : AppColors.greyDark),
      ),
    );
  }
}
