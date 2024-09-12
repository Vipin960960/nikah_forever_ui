import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nikah_forever_ui/app/app_widgets/app_text_style.dart';
import 'package:nikah_forever_ui/app/modules/home/controllers/home_controller.dart';

import '../../../app_widgets/custom_text_form_field.dart';
import '../../../constants/app_colors.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          height: Get.height,
          child: SafeArea(
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
                        style: AppTextStyle.bold(
                            fontSize: 12, color: AppColors.pinkAccent),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      Text(
                        "Social Details",
                        style: AppTextStyle.bold(fontSize: 12),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      Text(
                        "Verification",
                        style: AppTextStyle.bold(fontSize: 12),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),

                  CustomTextFormField(
                    controller: controller.nameTextController,
                    labelText: "Enter your name",
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return 'Please enter a name.';
                      } else if (value.length < 2) {
                        return 'Please provide a valid name';
                      } else {
                        return null;
                      }
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
                    validator: (value) {
                      return null;
                    },
                  ),

                  const SizedBox(height: 10),

                  CustomTextFormField(
                    controller: controller.heightTextController,
                    labelText: "Height*",
                    suffixIcon: const Icon(Icons.keyboard_arrow_down),
                    onTap: (value) {
                      controller.onClickDateOfBirth();
                    },
                    validator: (value) {
                      return null;
                    },
                  ),

                  const SizedBox(height: 10),

                  CustomTextFormField(
                    controller: controller.whereDoYouLiveTextController,
                    labelText: "Where do you live*",
                    suffixIcon: const Icon(Icons.keyboard_arrow_down),
                    onTap: (value) {
                      controller.onClickDateOfBirth();
                    },
                    validator: (value) {
                      return null;
                    },
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ChoiceButton(label: "Yes", onPressed: () {}),
                      const SizedBox(width: 20),
                      ChoiceButton(label: "No", onPressed: () {}),
                    ],
                  ),
                  const Spacer(),

                  // Next Button
                  Center(
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.pink,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Next",
                              style: AppTextStyle.bold(
                                  fontSize: 15, color: AppColors.white),
                            ),
                          ),
                          if (false)
                            const SizedBox(
                              width: 30,
                            ),
                          if (false)
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
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Step Indicator Widget
class StepIndicator extends StatelessWidget {
  final bool isActive;
  final int step;

  const StepIndicator({
    super.key,
    required this.isActive,
    required this.step,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: CircleAvatar(
        radius: 13,
        backgroundColor: isActive ? Colors.pinkAccent : Colors.grey[500],
        child: Center(
          child: CircleAvatar(
            radius: 11,
            backgroundColor: Colors.white,
            child: Text(
              step.toString(),
              style: AppTextStyle.custom(
                  fontSize: 12,
                  color: isActive ? Colors.pinkAccent : Colors.grey[500],
                  fontWeight: FontWeight.w300),
            ),
          ),
        ),
      ),
    );
  }
}

// Step Indicator Widget
class CustomLinearProgress extends StatelessWidget {
  final double progress;

  const CustomLinearProgress({
    super.key,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        child: LinearProgressIndicator(
          value: progress, // 50% progress
          color: Colors.pinkAccent,
          backgroundColor: Colors.grey[300],
          minHeight: 3,
        ),
      ),
    );
  }
}

class ChoiceButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const ChoiceButton({super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 4),
        side: BorderSide(color: AppColors.greyLight, width: 1.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Text(
        label,
        style: AppTextStyle.bold(fontSize: 15, color: AppColors.greyDark),
      ),
    );
  }
}
