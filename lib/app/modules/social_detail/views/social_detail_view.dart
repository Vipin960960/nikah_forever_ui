import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nikah_forever_ui/app/app_widgets/app_text_style.dart';
import 'package:nikah_forever_ui/app/utils/common_methods.dart';

import '../../../app_widgets/custom_linear_progress.dart';
import '../../../app_widgets/custom_text_form_field.dart';
import '../../../app_widgets/step_indicator.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_strings.dart';
import '../controllers/social_detail_controller.dart';

class SocialDetailView extends GetView<SocialDetailController> {
  const SocialDetailView({super.key});

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
                  StepIndicator(status: StepStatus.complete, step: 2),
                  CustomLinearProgress(progress: 1),
                  StepIndicator(status: StepStatus.active, step: 2),
                  CustomLinearProgress(progress: 0.5),
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
                    style:
                        AppTextStyle.bold(fontSize: 12, color: AppColors.pink),
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
              const SizedBox(height: 25),
              Expanded(
                child: SingleChildScrollView(
                  child: FadeInUp(
                    duration: const Duration(seconds: 1),
                    child: Form(
                      key: controller.socialDetailFormKey,
                      child: Obx(
                        () => Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustomTextFormField(
                              controller:
                                  controller.maritalStatusTextController,
                              labelText: AppStrings.maritalStatus,
                              suffixIcon: const Icon(Icons.keyboard_arrow_down),
                              validator: CommonMethods.commonValidation,
                              onTap: (value) {
                                controller.onClickMaritalStatus();
                              },
                            ),
                            const SizedBox(height: 3),
                            CustomTextFormField(
                              controller: controller.motherTongueTextController,
                              labelText: AppStrings.motherTongue,
                              suffixIcon: const Icon(Icons.keyboard_arrow_down),
                              validator: CommonMethods.commonValidation,
                              onTap: (value) {
                                controller.onClickMotherTongue();
                              },
                            ),
                            const SizedBox(height: 3),
                            CustomTextFormField(
                              controller: controller.sectCasteTextController,
                              labelText: AppStrings.sectCaste,
                              suffixIcon: const Icon(Icons.keyboard_arrow_down),
                              validator: CommonMethods.commonValidation,
                              onTap: (value) {
                                controller.onClickSectCaste();
                              },
                            ),
                            if (controller.selectedCasteString.value.isNotEmpty)
                              const SizedBox(height: 3),
                            if (controller.selectedCasteString.value.isNotEmpty)
                              CustomTextFormField(
                                controller: controller.maslakTextController,
                                labelText: AppStrings.maslak,
                                suffixIcon:
                                    const Icon(Icons.keyboard_arrow_down),
                                validator: (value) => null,
                                onTap: (value) {
                                  controller.onClickMaslak();
                                },
                              ),
                            const SizedBox(height: 3),
                            CustomTextFormField(
                              controller:
                                  controller.highestEducationTextController,
                              labelText: AppStrings.highestEducation,
                              suffixIcon: const Icon(Icons.keyboard_arrow_down),
                              validator: CommonMethods.commonValidation,
                              onTap: (value) {
                                controller.onClickHighestEducation();
                              },
                            ),
                            if (controller
                                .selectedHigherEducation.value.isNotEmpty)
                              const SizedBox(height: 3),
                            if (controller
                                .selectedHigherEducation.value.isNotEmpty)
                              CustomTextFormField(
                                controller: controller.employedInTextController,
                                labelText: AppStrings.employedIn,
                                suffixIcon:
                                    const Icon(Icons.keyboard_arrow_down),
                                validator: CommonMethods.commonValidation,
                                onTap: (value) {
                                  controller.onClickEmployedIn();
                                },
                              ),
                            if (controller.selectedEmployedIn.value.isNotEmpty)
                              const SizedBox(height: 3),
                            if (controller.selectedEmployedIn.value.isNotEmpty)
                              CustomTextFormField(
                                controller: controller.occupationTextController,
                                labelText: AppStrings.occupation,
                                suffixIcon:
                                    const Icon(Icons.keyboard_arrow_down),
                                validator: CommonMethods.commonValidation,
                                onTap: (value) {
                                  controller.onClickOccupation();
                                },
                              ),
                            if (controller.selectedEmployedIn.value.isNotEmpty)
                              const SizedBox(height: 3),
                            if (controller.selectedEmployedIn.value.isNotEmpty)
                              CustomTextFormField(
                                controller:
                                    controller.annualIncomeTextController,
                                labelText: AppStrings.annualIncome,
                                suffixIcon:
                                    const Icon(Icons.keyboard_arrow_down),
                                validator: CommonMethods.commonValidation,
                                onTap: (value) {
                                  controller.onClickAnnualIncome();
                                },
                              ),
                            if (controller
                                .annualIncomeInRupees.value.isNotEmpty)
                              Text(
                                "     ${controller.annualIncomeInRupees.value}",
                                style: AppTextStyle.regular(
                                  fontSize: 13,
                                  color: AppColors.red,
                                ),
                              ),
                            const SizedBox(
                              height: 20,
                            )
                          ],
                        ),
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
