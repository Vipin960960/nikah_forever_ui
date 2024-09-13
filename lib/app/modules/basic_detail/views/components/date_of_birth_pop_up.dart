import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nikah_forever_ui/app/modules/basic_detail/controllers/basic_detail_controller.dart';

import '../../../../app_widgets/app_text_style.dart';
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
                "Add Date of Birth",
                style: AppTextStyle.bold(fontSize: 18),
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
          height: 350,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            dateOrder: DatePickerDateOrder.dmy,
            initialDateTime: controller.date == null
                ? null
                : DateTime(
                    int.parse(
                      controller.date![2],
                    ),
                    int.parse(
                      controller.date![1],
                    ),
                    int.parse(
                      controller.date![0],
                    ),
                  ),
            onDateTimeChanged: (date) {
              controller.dateString = "${date.day}-${date.month}-${date.year}";
            },
          ),
        ),
        InkWell(
          onTap: () {
            controller.onClickConfirmOfDateOfBirth(controller.dateString);
          },
          child: Container(
            height: 50,
            width: Get.width,
            margin: const EdgeInsets.only(left: 18.0, right: 18),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.pink,
            ),
            child: Center(
              child: Text(
                "Confirm",
                style: AppTextStyle.bold(fontSize: 15, color: AppColors.white),
              ),
            ),
          ),
        )
      ],
    );
  }
}
