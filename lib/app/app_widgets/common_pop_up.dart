import 'package:flutter/material.dart';
import 'package:nikah_forever_ui/app/app_widgets/app_text_style.dart';
import 'package:nikah_forever_ui/app/app_widgets/custom_text_form_field.dart';

import '../constants/app_colors.dart';

class CommonPopUp {
  static void showBottomSheet({BuildContext? context, required Widget widget}) {
    showModalBottomSheet(
      context: context!,
      backgroundColor: AppColors.white,
      isScrollControlled: true,
      isDismissible: true,
      builder: (context) {
        return AnimatedPadding(
          padding: MediaQuery.of(context).viewInsets,
          duration: const Duration(milliseconds: 100),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.55,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25.0),
                topRight: Radius.circular(25.0),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 60,
                  height: 7,
                  decoration: BoxDecoration(
                    color: AppColors.greyLight,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                widget
              ],
            ),
          ),
        );
      },
    );
  }

  static void showBottomSheetSearchAble(
      {BuildContext? context, required List<String> list}) {
    TextEditingController controller = TextEditingController();
    showModalBottomSheet(
      context: context!,
      backgroundColor: AppColors.white,
      isScrollControlled: true,
      isDismissible: true,
      builder: (context) {
        return AnimatedPadding(
          padding: MediaQuery.of(context).viewInsets,
          duration: const Duration(milliseconds: 100),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.55,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25.0),
                topRight: Radius.circular(25.0),
              ),
            ),
            child: Column(
              children: [
                CustomTextFormField(
                  controller: controller,
                  validator: (value) {
                    return null;
                  },
                  labelText: "Search",
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Icon(
                            Icons.circle_outlined,
                            size: 15,
                            color: AppColors.blackLight,
                          ),
                          Text(
                            list[index],
                            style: AppTextStyle.bold(fontSize: 17),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
