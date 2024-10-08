import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nikah_forever_ui/app/constants/app_strings.dart';
import 'package:nikah_forever_ui/app/modules/basic_detail/controllers/basic_detail_controller.dart';

import '../../../../app_widgets/app_text_style.dart';
import '../../../../app_widgets/custom_date_picker.dart';
import '../../../../constants/app_colors.dart';

class DateOfBirthPopUp extends GetView<BasicDetailController> {
  const DateOfBirthPopUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 25.0, right: 25, top: 20),
          child: Row(
            children: [
              Text(
                AppStrings.addDateOfBirth,
                style: AppTextStyle.bold(fontSize: 19),
              ),
              const Spacer(),
              InkWell(
                onTap: Get.back,
                child: const Icon(
                  Icons.close,
                  color: Colors.pink,
                  size: 30,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 320,
          child: CustomDatePicker(
            itemExtent: 50,
            minDate: controller.minDateOfBirth,
            maxDate: controller.maxDateOfBirth,
            selectedDate: controller.selectedDateOfBirth,
            selectionOverlay: Container(
              width: double.infinity,
              height: 50,
              margin: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: AppColors.greyLight.withOpacity(0.15),
                borderRadius: BorderRadius.circular(7),
              ),
            ),
            selectedStyle: AppTextStyle.regular(fontSize: 20),
            unselectedStyle: AppTextStyle.regular(fontSize: 20),
            disabledStyle: AppTextStyle.regular(fontSize: 20),
            onSelectedItemChanged: (date) =>
                controller.selectedDateOfBirth = date,
          ),
        ),
        InkWell(
          onTap: () {
            DateTime date = controller.selectedDateOfBirth;
            controller.onClickConfirmOfDateOfBirth(
                "${date.day}-${date.month}-${date.year}");
          },
          child: Container(
            height: 50,
            width: Get.width,
            margin: const EdgeInsets.only(left: 18.0, right: 18, bottom: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.pink,
            ),
            child: Center(
              child: Text(
                AppStrings.confirmButton,
                style: AppTextStyle.bold(fontSize: 20, color: AppColors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
