import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nikah_forever_ui/app/constants/app_form_list_data.dart';

import '../../../routes/app_pages.dart';
import '../../../utils/common_methods.dart';
import '../../../utils/common_pop_up.dart';
import '../views/components/date_of_birth_pop_up.dart';

class BasicDetailController extends GetxController {
  final basicDetailFormKey = GlobalKey<FormState>();

  late TextEditingController nameTextController;
  late TextEditingController dateOfBirthTextController;
  late TextEditingController heightTextController;
  late TextEditingController whereDoYouLiveTextController;
  late TextEditingController whereDoesYourFamilyLiveTextController;

  //isLivingWithFamily Value = 1 will be Yes, Value = 2 will be No
  RxInt isLivingWithFamily = 0.obs;

  RxBool isHittingApi = false.obs;

  String dateString = "";

  List<String>? date = [];

  late final DateTime minDate;
  late final DateTime maxDate;
  late DateTime selectedDate;

  @override
  void onInit() {
    nameTextController = TextEditingController();
    dateOfBirthTextController = TextEditingController();
    heightTextController = TextEditingController();
    whereDoYouLiveTextController = TextEditingController();
    whereDoesYourFamilyLiveTextController = TextEditingController();

    final currentDate = DateTime.now();
    minDate = DateTime(
      currentDate.year - 100,
      currentDate.month,
      currentDate.day,
    );
    maxDate = DateTime(
      currentDate.year - 18,
      currentDate.month,
      currentDate.day,
    );
    selectedDate = maxDate;

    super.onInit();
  }

  @override
  void onClose() {
    nameTextController.dispose();
    dateOfBirthTextController.dispose();
    heightTextController.dispose();
    whereDoesYourFamilyLiveTextController.dispose();

    super.onClose();
  }

  void onClickDateOfBirth() {
    date = dateOfBirthTextController.text.isNotEmpty
        ? dateOfBirthTextController.text.split("-")
        : null;

    CommonPopUp.showBottomSheetCustom(
        context: Get.context,
        removeTopRounder: true,
        widget: const DateOfBirthPopUp());
  }

  void onClickHeight() {
    CommonPopUp.showBottomSheetList(
      context: Get.context,
      list: AppFormListData.instance.heightList,
      title: 'Select Height*',
      selectedValue: heightTextController.text,
      removeSearchBox: true,
      onTap: (value) {
        heightTextController.text = value;
        callListWhichIsEmpty("height");
      },
    );
  }

  void onClickWhereDoYouLive(controller) {
    String selectedCountry = "";
    String selectedState = "";
    String selectedCity = "";

    String oldCountry = controller.text;
    if (oldCountry != "") {
      selectedCountry = oldCountry.split(", ")[0];
      selectedState = oldCountry.split(", ")[1];
      selectedCity = oldCountry.split(", ")[2];
    }
    CommonPopUp.showBottomSheetList(
      context: Get.context,
      height: Get.height * 0.7,
      list: AppFormListData.instance.countryMap.keys.toList(),
      title: 'Select Country',
      selectedValue: selectedCountry,
      onTap: (country) async {
        // Selecting State
        await Future.delayed(const Duration(milliseconds: 100));
        CommonPopUp.showBottomSheetList(
          context: Get.context,
          height: Get.height * 0.7,
          list: AppFormListData.instance.countryMap[country]!.keys.toList(),
          title: 'State in $country',
          selectedValue: selectedState,
          onTap: (state) async {
            // Selecting city
            await CommonMethods.timerForNextList();

            CommonPopUp.showBottomSheetList(
              context: Get.context,
              height: Get.height * 0.7,
              list: AppFormListData.instance.countryMap[country]![state]!,
              title: 'City in $state',
              selectedValue: selectedCity,
              onTap: (city) {
                controller.text = "$country, $state, $city";
                callListWhichIsEmpty("whereDoYouLive");
              },
            );
          },
        );
      },
    );
  }

  void onClickYesButtonDoesYourFamilyLive() {
    isLivingWithFamily.value = 1;
  }

  void onClickNoButtonDoesYourFamilyLive() {
    isLivingWithFamily.value = 2;
  }

  Future<void> onClickNext() async {
    if (basicDetailFormKey.currentState!.validate()) {
      isHittingApi.value = true;
      await Future.delayed(const Duration(seconds: 2));
      isHittingApi.value = false;

      Get.offNamed(Routes.SOCIAL_DETAIL);
    }
  }

  void onClickConfirmOfDateOfBirth(value) {
    dateOfBirthTextController.text = value;
    Get.back();
    callListWhichIsEmpty("date");
  }

  Future<void> callListWhichIsEmpty(comingFrom) async {
    await CommonMethods.timerForNextList();

    if (comingFrom == "date" && heightTextController.text.isEmpty) {
      onClickHeight();
    } else if (comingFrom == "height" &&
        whereDoYouLiveTextController.text.isEmpty) {
      onClickWhereDoYouLive(whereDoYouLiveTextController);
    } else if (dateOfBirthTextController.text.isEmpty) {
      onClickDateOfBirth();
    } else if (heightTextController.text.isEmpty) {
      onClickHeight();
    } else if (whereDoYouLiveTextController.text.isEmpty) {
      onClickWhereDoYouLive(whereDoYouLiveTextController);
    }
  }
}
