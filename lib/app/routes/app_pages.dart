import 'package:get/get.dart';

import '../modules/basic_detail/bindings/basic_detail_binding.dart';
import '../modules/basic_detail/views/basic_detail_view.dart';
import '../modules/social_detail/bindings/social_detail_binding.dart';
import '../modules/social_detail/views/social_detail_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/verification/bindings/verification_binding.dart';
import '../modules/verification/views/verification_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.BASIC_DETAIL,
      page: () => const BasicDetailView(),
      binding: BasicDetailBinding(),
    ),
    GetPage(
      name: _Paths.SOCIAL_DETAIL,
      page: () => const SocialDetailView(),
      binding: SocialDetailBinding(),
    ),
    GetPage(
      name: _Paths.VERIFICATION,
      page: () => const VerificationView(),
      binding: VerificationBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
  ];
}
