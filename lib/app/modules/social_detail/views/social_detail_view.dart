import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nikah_forever_ui/app/app_widgets/app_text_style.dart';
import 'package:nikah_forever_ui/app/utils/common_methods.dart';

import '../../../app_widgets/custom_linear_progress.dart';
import '../../../app_widgets/custom_text_form_field.dart';
import '../../../app_widgets/step_indicator.dart';
import '../../../constants/app_assets.dart';
import '../../../constants/app_colors.dart';
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: AppColors.pink,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image.asset(
                      AppAssetsImage.tick,
                      width: 14,
                      color: AppColors.white,
                    ),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  const CustomLinearProgress(progress: 1),
                  const StepIndicator(isActive: true, step: 2),
                  const CustomLinearProgress(progress: 0.5),
                  const StepIndicator(isActive: false, step: 3),
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
                    style:
                        AppTextStyle.bold(fontSize: 12, color: AppColors.pink),
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
              const SizedBox(height: 25),
              Expanded(
                child: SingleChildScrollView(
                  child: SizedBox(
                    height: Get.height,
                    child: Form(
                      key: controller.socialDetailFormKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomTextFormField(
                            controller: controller.maritalStatusTextController,
                            labelText: "Marital Status*",
                            suffixIcon: const Icon(Icons.keyboard_arrow_down),
                            validator: CommonMethods.commonValidation,
                            onTap: (value) {
                              controller.onClickMaritalStatus();
                            },
                          ),
                          const SizedBox(height: 3),
                          CustomTextFormField(
                            controller: controller.motherTongueTextController,
                            labelText: "Mother Tongue*",
                            suffixIcon: const Icon(Icons.keyboard_arrow_down),
                            validator: CommonMethods.commonValidation,
                            onTap: (value) {
                              controller.onClickMotherTongue();
                            },
                          ),
                          const SizedBox(height: 3),
                          CustomTextFormField(
                            controller: controller.sectCasteTextController,
                            labelText: "Sect/Caste",
                            suffixIcon: const Icon(Icons.keyboard_arrow_down),
                            validator: CommonMethods.commonValidation,
                            onTap: (value) {
                              controller.onClickSectCaste();
                            },
                          ),
                          const SizedBox(height: 3),
                          CustomTextFormField(
                            controller: controller.maslakTextController,
                            labelText: "Maslak (Optional)",
                            suffixIcon: const Icon(Icons.keyboard_arrow_down),
                            validator: CommonMethods.commonValidation,
                            onTap: (value) {
                              controller.onClickMaslak();
                            },
                          ),
                          const SizedBox(height: 3),
                          CustomTextFormField(
                            controller:
                                controller.highestEducationTextController,
                            labelText: "Highest Education*",
                            suffixIcon: const Icon(Icons.keyboard_arrow_down),
                            validator: CommonMethods.commonValidation,
                            onTap: (value) {
                              controller.onClickHighestEducation();
                            },
                          ),
                          const SizedBox(height: 3),
                          CustomTextFormField(
                            controller: controller.employedInTextController,
                            labelText: "Employed In*",
                            suffixIcon: const Icon(Icons.keyboard_arrow_down),
                            validator: CommonMethods.commonValidation,
                            onTap: (value) {
                              controller.onClickEmployedIn();
                            },
                          ),
                          const SizedBox(height: 3),
                          CustomTextFormField(
                            controller: controller.occupationTextController,
                            labelText: "Occupation*",
                            suffixIcon: const Icon(Icons.keyboard_arrow_down),
                            validator: CommonMethods.commonValidation,
                            onTap: (value) {
                              controller.onClickOccupation();
                            },
                          ),
                          const SizedBox(height: 3),
                          CustomTextFormField(
                            controller: controller.annualIncomeTextController,
                            labelText: "Annual Income*",
                            suffixIcon: const Icon(Icons.keyboard_arrow_down),
                            validator: CommonMethods.commonValidation,
                            onTap: (value) {
                              controller.onClickAnnualIncome();
                            },
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
