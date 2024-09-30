import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:nikah_forever_ui/app/constants/app_strings.dart';

import 'app/app_widgets/app_text_style.dart';
import 'app/constants/app_colors.dart';
import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GlobalLoaderOverlay(
      overlayColor: Colors.transparent,
      overlayWidgetBuilder: (_) {
        return Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: AppColors.mainBackground,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(
                  strokeWidth: 2,
                  semanticsLabel: AppStrings.loading,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    AppColors.blue,
                  ),
                ),
                Text(
                  AppStrings.pleaseWait,
                  style: AppTextStyle.regular(
                    color: AppColors.blue,
                  ),
                )
              ],
            ),
          ),
        );
      },
      child: GetMaterialApp(
        title: AppStrings.appName,
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}
