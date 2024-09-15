import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class VerificationController extends GetxController {
  late TextEditingController pinTextController;

  @override
  void onInit() {
    pinTextController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    pinTextController.dispose();
    super.onClose();
  }
}
