import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nikah_forever_ui/app/app_widgets/app_text_style.dart';
import 'package:nikah_forever_ui/app/constants/app_strings.dart';
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
                  StepIndicator(status: StepStatus.active, step: 1),
                  CustomLinearProgress(progress: 0.5),
                  StepIndicator(status: StepStatus.inactive, step: 2),
                  CustomLinearProgress(progress: 0),
                  StepIndicator(status: StepStatus.inactive, step: 3),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.basicDetails,
                    style:
                        AppTextStyle.bold(fontSize: 12, color: AppColors.pink),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  Text(
                    AppStrings.socialDetails,
                    style: AppTextStyle.regular(fontSize: 12),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  Text(
                    AppStrings.verification,
                    style: AppTextStyle.regular(fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    key: controller.basicDetailFormKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomTextFormField(
                          controller: controller.nameTextController,
                          labelText: AppStrings.enterName,
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            return null;
                          },
                        ),
                        const SizedBox(height: 5),
                        CustomTextFormField(
                          controller: controller.dateOfBirthTextController,
                          labelText: AppStrings.dateOfBirth,
                          suffixIcon: const Icon(Icons.keyboard_arrow_down),
                          validator: CommonMethods.commonValidation,
                          onTap: (value) {
                            controller.onClickDateOfBirth();
                          },
                        ),
                        const SizedBox(height: 5),
                        CustomTextFormField(
                          controller: controller.heightTextController,
                          labelText: AppStrings.height,
                          suffixIcon: const Icon(Icons.keyboard_arrow_down),
                          validator: CommonMethods.commonValidation,
                          onTap: (value) {
                            controller.onClickHeight();
                          },
                        ),
                        const SizedBox(height: 5),
                        CustomTextFormField(
                          controller: controller.whereDoYouLiveTextController,
                          labelText: AppStrings.whereDoYouLive,
                          suffixIcon: const Icon(Icons.keyboard_arrow_down),
                          validator: CommonMethods.commonValidation,
                          onTap: (value) {
                            controller.onClickWhereDoYouLive(
                                controller.whereDoYouLiveTextController);
                          },
                        ),
                        const SizedBox(height: 15),
                        Text(
                          AppStrings.doYouLiveWithFamily,
                          style: AppTextStyle.regular(
                            fontSize: 13,
                            color: AppColors.greyLight,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Obx(
                          () => Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ChoiceButton(
                                    label: AppStrings.yesButton,
                                    onPressed: controller
                                        .onClickYesButtonDoesYourFamilyLive,
                                    status: controller.getYesNoPressed(true),
                                  ),
                                  const SizedBox(width: 20),
                                  ChoiceButton(
                                    label: AppStrings.noButton,
                                    onPressed: controller
                                        .onClickNoButtonDoesYourFamilyLive,
                                    status: controller.getYesNoPressed(false),
                                  ),
                                ],
                              ),
                              if (controller.isLivingWithFamily.value == 4)
                                Padding(
                                  padding: const EdgeInsets.only(top: 5.0),
                                  child: Text(
                                    "     ${AppStrings.fieldCanNotBeEmpty}",
                                    style: AppTextStyle.regular(
                                      fontSize: 13,
                                      color: AppColors.red,
                                    ),
                                  ),
                                ),
                              if (controller.isLivingWithFamily.value == 2)
                                const SizedBox(height: 10),
                              if (controller.isLivingWithFamily.value == 2)
                                CustomTextFormField(
                                  controller: controller
                                      .whereDoesYourFamilyLiveTextController,
                                  labelText: AppStrings.whereDoesYourFamilyLive,
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
                                ? AppStrings.pleaseWaitButton
                                : AppStrings.nextButton,
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
