import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class VerificationController extends GetxController {
  late TextEditingController pinTextController;
  late Timer _timer;
  RxInt otpRemainingSeconds = 59.obs;

  @override
  void onInit() {
    pinTextController = TextEditingController();
    startTimer();
    super.onInit();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (otpRemainingSeconds.value == 0) {
          otpRemainingSeconds.value = 59;
        } else {
          otpRemainingSeconds.value--;
        }
      },
    );
  }

  @override
  void onClose() {
    pinTextController.dispose();
    _timer.cancel();
    super.onClose();
  }
}
