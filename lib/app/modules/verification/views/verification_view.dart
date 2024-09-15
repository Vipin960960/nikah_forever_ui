import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nikah_forever_ui/app/app_widgets/app_text_style.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_strings.dart';
import '../controllers/verification_controller.dart';

class VerificationView extends GetView<VerificationController> {
  const VerificationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBackground,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Get.height * 0.07,
              ),
              Center(
                child: Text(
                  "Verify Mobile Number",
                  style: AppTextStyle.bold(fontSize: 28),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  "Enter the 4-digit code sent to",
                  style: AppTextStyle.regular(fontSize: 16),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "+917078277678",
                    style: AppTextStyle.bold(),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.edit,
                    color: AppColors.pink,
                  )
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              PinCodeTextField(
                length: 4,
                obscureText: false,
                animationType: AnimationType.fade,
                keyboardType: TextInputType.number,
                pinTheme: PinTheme(
                  fieldHeight: 50,
                  fieldWidth: Get.width / 5.5,
                  inactiveColor: AppColors.greyLight,
                  activeColor: AppColors.black,
                  selectedColor: AppColors.black,
                ),
                onCompleted: (String value) {
                  // Do something with the completed code
                },
                appContext: Get.context!,
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Icon(
                    Icons.phone_android,
                    color: AppColors.pink,
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Text.rich(
                    TextSpan(
                      text: '',
                      children: <InlineSpan>[
                        TextSpan(
                          text: 'Resend SMS in ',
                          style: AppTextStyle.regular(fontSize: 15),
                        ),
                        TextSpan(
                          text: '00:40',
                          style: AppTextStyle.bold(fontSize: 15),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                height: 50,
                width: Get.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.pink,
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      AppStrings.verifyButton,
                      style: AppTextStyle.bold(
                          fontSize: 20, color: AppColors.white),
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
