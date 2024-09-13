import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/app_colors.dart';
import 'app_text_style.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  final Widget? suffixIcon;
  final Widget? prefixIcon;

  final bool? obscureText;

  final void Function(String value)? onTap;
  final String? Function(String? value) validator;
  final String? labelText;

  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.validator,
    required this.labelText,
    this.onTap,
    this.keyboardType,
    this.inputFormatters,
    this.obscureText,
    this.suffixIcon,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: TextFormField(
        controller: controller,
        readOnly: onTap != null ? true : false,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        textCapitalization: TextCapitalization.sentences,
        keyboardType: keyboardType ?? TextInputType.text,
        style: AppTextStyle.regular(),
        inputFormatters: inputFormatters,
        validator: validator,
        obscureText: obscureText ?? false,
        onTap: () {
          if (onTap != null) {
            onTap!(controller.text);
          }
        },
        decoration: InputDecoration(
          filled: true,
          labelText: labelText,
          floatingLabelStyle:
              AppTextStyle.regular(fontSize: 15, color: AppColors.greyLight),
          labelStyle:
              AppTextStyle.regular(fontSize: 12, color: AppColors.greyLight),
          errorStyle: AppTextStyle.regular(fontSize: 13, color: AppColors.pink),
          contentPadding: const EdgeInsets.all(15),
          fillColor: AppColors.mainBackground,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              width: 1.5,
              color: AppColors.greyLight,
              style: BorderStyle.none,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: AppColors.greyLight,
              width: 1.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: AppColors.greyLight,
              width: 1.5,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: AppColors.pink,
              width: 1.5,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: AppColors.pink,
              width: 1.5,
            ),
          ),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
        ),
      ),
    );
  }
}
