import 'package:get/get.dart';

import '../controllers/basic_detail_controller.dart';

class BasicDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BasicDetailController>(
      () => BasicDetailController(),
    );
  }
}
