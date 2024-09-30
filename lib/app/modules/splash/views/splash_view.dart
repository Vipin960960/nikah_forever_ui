import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nikah_forever_ui/app/app_widgets/app_text_style.dart';
import 'package:nikah_forever_ui/app/constants/app_colors.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 150,
            ),
            Image.asset(
              controller.image,
              width: Get.width,
              height: 300,
            ),
            Center(
              child: Text(
                "Please Wait...",
                style:
                    AppTextStyle.regular(fontSize: 17, color: AppColors.blue),
              ),
            )
          ],
        ),
      ),
    );
  }
}
