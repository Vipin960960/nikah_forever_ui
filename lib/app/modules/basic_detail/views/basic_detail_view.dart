import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nikah_forever_ui/app/app_widgets/app_text_style.dart';
import 'package:nikah_forever_ui/app/utils/common_methods.dart';

import '../../../app_widgets/choice_button.dart';
import '../../../app_widgets/custom_linear_progress.dart';
import '../../../app_widgets/custom_text_form_field.dart';
import '../../../app_widgets/step_indicator.dart';
import '../../../constants/app_colors.dart';
import '../controllers/basic_detail_controller.dart';

class BasicDetailView extends GetView<BasicDetailController> {
  const BasicDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 26, 16, 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  StepIndicator(isActive: true, step: 1),
                  CustomLinearProgress(progress: 0.5),
                  StepIndicator(isActive: false, step: 2),
                  CustomLinearProgress(progress: 0),
                  StepIndicator(isActive: false, step: 3),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Basic Details",
                    style:
                        AppTextStyle.bold(fontSize: 12, color: AppColors.pink),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  Text(
                    "Social Details",
                    style: AppTextStyle.regular(fontSize: 12),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  Text(
                    "Verification",
                    style: AppTextStyle.regular(fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Expanded(
                child: SingleChildScrollView(
                  child: SizedBox(
                    height: Get.height * 0.9,
                    child: Form(
                      key: controller.basicDetailFormKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomTextFormField(
                            controller: controller.nameTextController,
                            labelText: "Enter your name",
                            validator: (value) {
                              return null;
                            },
                            keyboardType: TextInputType.name,
                          ),
                          const SizedBox(height: 10),
                          CustomTextFormField(
                            controller: controller.dateOfBirthTextController,
                            labelText: "Date of birth*",
                            suffixIcon: const Icon(Icons.keyboard_arrow_down),
                            onTap: (value) {
                              controller.onClickDateOfBirth();
                            },
                            validator: CommonMethods.commonValidation,
                          ),
                          const SizedBox(height: 10),
                          CustomTextFormField(
                            controller: controller.heightTextController,
                            labelText: "Height*",
                            suffixIcon: const Icon(Icons.keyboard_arrow_down),
                            onTap: (value) {
                              controller.onClickHeight();
                            },
                            validator: CommonMethods.commonValidation,
                          ),
                          const SizedBox(height: 10),
                          CustomTextFormField(
                            controller: controller.whereDoYouLiveTextController,
                            labelText: "Where do you live*",
                            suffixIcon: const Icon(Icons.keyboard_arrow_down),
                            onTap: (value) {
                              controller.onClickWhereDoYouLive(
                                  controller.whereDoYouLiveTextController);
                            },
                            validator: CommonMethods.commonValidation,
                          ),
                          const SizedBox(height: 20),
                          Text(
                            "  Do you live with your family?",
                            style: AppTextStyle.regular(
                              fontSize: 13,
                              color: AppColors.greyLight,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Obx(
                            () => Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    ChoiceButton(
                                      label: "Yes",
                                      onPressed: controller
                                          .onClickYesButtonDoesYourFamilyLive,
                                      isPressed:
                                          controller.isLivingWithFamily.value ==
                                              1,
                                    ),
                                    const SizedBox(width: 20),
                                    ChoiceButton(
                                      label: "No",
                                      onPressed: controller
                                          .onClickNoButtonDoesYourFamilyLive,
                                      isPressed:
                                          controller.isLivingWithFamily.value ==
                                              2,
                                    ),
                                  ],
                                ),
                                if (controller.isLivingWithFamily.value == 2)
                                  const SizedBox(height: 10),
                                if (controller.isLivingWithFamily.value == 2)
                                  CustomTextFormField(
                                    controller: controller
                                        .whereDoesYourFamilyLiveTextController,
                                    labelText: "Where does your family live*",
                                    suffixIcon:
                                        const Icon(Icons.keyboard_arrow_down),
                                    onTap: (value) {
                                      controller.onClickWhereDoYouLive(controller
                                          .whereDoesYourFamilyLiveTextController);
                                    },
                                    validator: CommonMethods.commonValidation,
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: controller.onClickNext,
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.pink,
                  ),
                  child: Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            controller.isHittingApi.value
                                ? "Please wait"
                                : "Next",
                            style: AppTextStyle.bold(
                                fontSize: 15, color: AppColors.white),
                          ),
                        ),
                        if (controller.isHittingApi.value)
                          const SizedBox(
                            width: 30,
                          ),
                        if (controller.isHittingApi.value)
                          SizedBox(
                            height: 25,
                            width: 25,
                            child: CircularProgressIndicator(
                              color: AppColors.white,
                            ),
                          )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
