import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import 'app_text_style.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: AppColors.mainBackground,
        padding: const EdgeInsets.symmetric(
          horizontal: 50,
          vertical: 4,
        ),
        side: BorderSide(color: AppColors.greyDark, width: 1.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Text(
        label,
        style: AppTextStyle.bold(
          fontSize: 15,
          color: AppColors.greyDark,
        ),
      ),
    );
  }
}
