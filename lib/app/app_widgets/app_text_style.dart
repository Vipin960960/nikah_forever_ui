import 'package:flutter/material.dart';
import 'package:nikah_forever_ui/app/constants/app_strings.dart';

import '../constants/app_colors.dart';

class AppTextStyle {
  /// Gives bold font of open-sans of font size 16 & default
  /// weight is w400.
  static TextStyle regular({
    double fontSize = 16,
    Color? color,
  }) {
    return TextStyle(
      fontFamily: AppStrings.fontName,
      fontSize: fontSize,
      color: color ?? AppColors.black,
      fontWeight: FontWeight.w400,
    );
  }

  /// Gives bold font of open-sans of font size 25 & default
  /// weight is w500.
  static TextStyle bold({
    double fontSize = 25,
    Color? color,
  }) {
    return TextStyle(
      fontFamily: AppStrings.fontName,
      fontSize: fontSize,
      color: color ?? AppColors.black,
      fontWeight: FontWeight.w600,
    );
  }

  /// Gives customization option of open-sans of font size 16
  /// & default weight is w400.
  static TextStyle custom({
    double fontSize = 16,
    FontWeight? fontWeight,
    Color? color,
    TextDecoration? decoration,
    Color? decorationColor,
    TextOverflow? overflow,
  }) {
    return TextStyle(
      fontFamily: AppStrings.fontName,
      fontSize: fontSize,
      color: color ?? AppColors.black,
      fontWeight: fontWeight ?? FontWeight.w400,
      decoration: decoration,
      decorationColor: decorationColor,
    );
  }
}
