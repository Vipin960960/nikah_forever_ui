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

  //isLivingWithFamily Value = 1 will be Yes, Value = 2 will be No, Value = 4 will be error
  RxInt isLivingWithFamily = 0.obs;

  RxBool isHittingApi = false.obs;

  late final DateTime minDateOfBirth;
  late final DateTime maxDateOfBirth;
  late DateTime selectedDateOfBirth;

  @override
  void onInit() {
    nameTextController = TextEditingController();
    dateOfBirthTextController = TextEditingController();
    heightTextController = TextEditingController();
    whereDoYouLiveTextController = TextEditingController();
    whereDoesYourFamilyLiveTextController = TextEditingController();

    // Selecting date of birth
    final currentDate = DateTime.now();
    minDateOfBirth = DateTime(
      currentDate.year - 74,
      currentDate.month,
      currentDate.day,
    );
    maxDateOfBirth = DateTime(
      currentDate.year - 21,
      12,
      31,
    );
    selectedDateOfBirth = DateTime(
      maxDateOfBirth.year - 3,
      7,
      15,
    );

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
    CommonPopUp.showBottomSheetCustom(
        context: Get.context,
        removeTopRounder: true,
        widget: const DateOfBirthPopUp());
  }

  void onClickHeight() {
    CommonPopUp.showBottomSheetList(
      context: Get.context,
      height: Get.height * 0.7,
      title: 'Select Height*',
      list: AppFormListData.instance.heightList,
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

    List<String> countriesList =
        AppFormListData.instance.countryMap.keys.toList();
    countriesList.sort();

    CommonPopUp.showBottomSheetList(
      context: Get.context,
      height: Get.height * 0.7,
      list: countriesList,
      title: 'Select Country',
      selectedValue: selectedCountry,
      onTap: (country) async {
        // Selecting State
        List<String> statesList =
            AppFormListData.instance.countryMap[country]!.keys.toList();
        statesList.sort();
        await CommonMethods.timerForNextList();
        CommonPopUp.showBottomSheetList(
          context: Get.context,
          height: Get.height * 0.7,
          list: statesList,
          title: 'State in $country',
          selectedValue: selectedState,
          onTap: (state) async {
            // Selecting city
            List<String> citiesList =
                AppFormListData.instance.countryMap[country]![state]!;
            citiesList.sort();
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

  void onClickConfirmOfDateOfBirth(value) {
    dateOfBirthTextController.text = value;
    Get.back();
    callListWhichIsEmpty("date");
  }

  Future<void> onClickNext() async {
    if (isLivingWithFamily.value == 0 || isLivingWithFamily.value == 4) {
      isLivingWithFamily.value = 4; //Just to show red
    }
    if (basicDetailFormKey.currentState!.validate()) {
      if (isLivingWithFamily.value == 0 || isLivingWithFamily.value == 4) {
        isLivingWithFamily.value = 4;
        return;
      }

      isHittingApi.value = true;
      await Future.delayed(const Duration(seconds: 2));
      isHittingApi.value = false;

      Get.offNamed(Routes.SOCIAL_DETAIL);
    }
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
