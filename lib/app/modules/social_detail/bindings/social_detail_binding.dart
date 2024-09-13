import 'package:get/get.dart';

import '../controllers/social_detail_controller.dart';

class SocialDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SocialDetailController>(
      () => SocialDetailController(),
    );
  }
}
