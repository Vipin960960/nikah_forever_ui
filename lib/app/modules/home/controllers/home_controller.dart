import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../app_widgets/common_pop_up.dart';

class HomeController extends GetxController {
  late TextEditingController nameTextController;
  late TextEditingController dateOfBirthTextController;
  late TextEditingController heightTextController;
  late TextEditingController whereDoYouLiveTextController;

  @override
  void onInit() {
    nameTextController = TextEditingController();
    dateOfBirthTextController = TextEditingController();
    heightTextController = TextEditingController();
    whereDoYouLiveTextController = TextEditingController();

    super.onInit();
  }

  @override
  void onClose() {
    nameTextController.dispose();
    dateOfBirthTextController.dispose();
    heightTextController.dispose();
    whereDoYouLiveTextController.dispose();

    super.onClose();
  }

  void onClickDateOfBirth() {
    CommonPopUp.showBottomSheetSearchAble(
        context: Get.context,
        list: [
          "Never married",
          "Divorced",
          "Separated",
          "Widowed",
          "Never married1",
          "Divorced1",
          "Separated1",
          "Widowed1",
          "Never married2",
          "Divorced2",
          "Separated2",
          "Widowed2"
        ],
        title: 'Select Material Status*',
        selectedValue: "Separated",
        removeSearchBox: true);
  }
}
