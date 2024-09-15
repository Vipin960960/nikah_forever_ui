import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nikah_forever_ui/app/constants/app_form_list_data.dart';
import 'package:nikah_forever_ui/app/constants/app_strings.dart';

import '../../../routes/app_pages.dart';
import '../../../utils/common_methods.dart';
import '../../../utils/common_pop_up.dart';

class SocialDetailController extends GetxController {
  final socialDetailFormKey = GlobalKey<FormState>();

  late TextEditingController maritalStatusTextController;
  late TextEditingController motherTongueTextController;
  late TextEditingController sectCasteTextController;
  late TextEditingController maslakTextController;
  late TextEditingController highestEducationTextController;
  late TextEditingController employedInTextController;
  late TextEditingController occupationTextController;
  late TextEditingController annualIncomeTextController;

  RxBool isHittingApi = false.obs;

  RxString selectedCasteString = "".obs;
  RxString selectedHigherEducation = "".obs;
  RxString selectedEmployedIn = "".obs;
  RxString annualIncomeInRupees = "".obs;

  @override
  void onInit() {
    maritalStatusTextController = TextEditingController();
    motherTongueTextController = TextEditingController();
    sectCasteTextController = TextEditingController();
    maslakTextController = TextEditingController();
    highestEducationTextController = TextEditingController();
    employedInTextController = TextEditingController();
    occupationTextController = TextEditingController();
    annualIncomeTextController = TextEditingController();

    super.onInit();
  }

  @override
  void onClose() {
    maritalStatusTextController.dispose();
    motherTongueTextController.dispose();
    sectCasteTextController.dispose();
    maslakTextController.dispose();
    highestEducationTextController.dispose();
    employedInTextController.dispose();
    occupationTextController.dispose();
    annualIncomeTextController.dispose();

    super.onClose();
  }

  void onClickMaritalStatus() {
    CommonPopUp.showBottomSheetList(
      context: Get.context,
      height: Get.height * 0.36,
      title: 'Select ${AppStrings.maritalStatus}',
      removeSearchBox: true,
      list: AppFormListData.instance.maritalStateList,
      selectedValue: maritalStatusTextController.text,
      onTap: (value) async {
        maritalStatusTextController.text = value;
        callListWhichIsEmpty(maritalStatusTextController);
      },
    );
  }

  void onClickMotherTongue() {
    CommonPopUp.showBottomSheetList(
      context: Get.context,
      height: Get.height * 0.7,
      title: 'Select ${AppStrings.motherTongue}',
      list: AppFormListData.instance.motherTongueList,
      selectedValue: motherTongueTextController.text,
      onTap: (value) async {
        motherTongueTextController.text = value;
        callListWhichIsEmpty(motherTongueTextController);
      },
    );
  }

  void onClickSectCaste() {
    String selectedSect = "";
    String selectedCaste = "";

    String oldSectCaste = sectCasteTextController.text;
    if (oldSectCaste != "") {
      selectedSect = oldSectCaste.split(", ")[0];
      selectedCaste = oldSectCaste.split(", ")[1];
    }

    CommonPopUp.showBottomSheetList(
      context: Get.context,
      height: Get.height * 0.3,
      title: 'Select Sect*',
      removeSearchBox: true,
      list: AppFormListData.instance.sectList,
      selectedValue: selectedSect,
      onTap: (sectValue) async {
        await CommonMethods.timerForNextList();
        // Showing Popup for Caste
        CommonPopUp.showBottomSheetList(
          context: Get.context,
          height: Get.height * 0.7,
          title: 'Select Caste*',
          removeSearchBox: true,
          list: AppFormListData.instance.casteList,
          selectedValue: selectedCaste,
          onTap: (casteValue) async {
            selectedCasteString.value = "$sectValue, $casteValue";
            sectCasteTextController.text = "$sectValue, $casteValue";
            callListWhichIsEmpty(sectCasteTextController);
          },
        );
      },
    );
  }

  void onClickMaslak() {
    CommonPopUp.showBottomSheetList(
      context: Get.context,
      title: 'Select ${AppStrings.maslak}',
      removeSearchBox: true,
      list: AppFormListData.instance.maslakList,
      selectedValue: maslakTextController.text,
      onTap: (value) {
        maslakTextController.text = value;
      },
    );
  }

  void onClickHighestEducation() {
    CommonPopUp.showBottomSheetList(
      context: Get.context,
      height: Get.height * 0.7,
      title: 'Select ${AppStrings.highestEducation}',
      list: AppFormListData.instance.highestEducationList,
      selectedValue: highestEducationTextController.text,
      onTap: (value) async {
        selectedHigherEducation.value = value;
        highestEducationTextController.text = value;

        callListWhichIsEmpty(highestEducationTextController);
      },
    );
  }

  void onClickEmployedIn() {
    CommonPopUp.showBottomSheetList(
      context: Get.context,
      title: 'Select ${AppStrings.employedIn}',
      removeSearchBox: true,
      list: AppFormListData.instance.employedIdList,
      selectedValue: employedInTextController.text,
      onTap: (value) async {
        selectedEmployedIn.value = value;
        employedInTextController.text = value;

        callListWhichIsEmpty(employedInTextController);
      },
    );
  }

  void onClickOccupation() {
    CommonPopUp.showBottomSheetList(
      context: Get.context,
      height: Get.height * 0.7,
      title: 'Select ${AppStrings.occupation}',
      list: AppFormListData.instance.occupationList,
      selectedValue: occupationTextController.text,
      onTap: (value) async {
        occupationTextController.text = value;
        callListWhichIsEmpty(occupationTextController);
      },
    );
  }

  void onClickAnnualIncome() {
    CommonPopUp.showBottomSheetList(
      context: Get.context,
      height: Get.height * 0.7,
      title: 'Select ${AppStrings.annualIncome}',
      list: AppFormListData.instance.annualIncomeList,
      selectedValue: annualIncomeTextController.text,
      onTap: (value) async {
        annualIncomeTextController.text = value;
        annualIncomeInRupees.value =
            AppFormListData.instance.annualIncomeInRupeesMap[value]!;
        callListWhichIsEmpty(annualIncomeTextController);
      },
    );
  }

  Future<void> onClickNext() async {
    if (socialDetailFormKey.currentState!.validate()) {
      isHittingApi.value = true;
      await Future.delayed(const Duration(seconds: 2));
      isHittingApi.value = false;
      Get.offNamed(Routes.VERIFICATION);
    }
  }

  Future<void> callListWhichIsEmpty(TextEditingController controller) async {
    await CommonMethods.timerForNextList();

    if (controller == maritalStatusTextController &&
        motherTongueTextController.text.isEmpty) {
      onClickMotherTongue();
    } else if (controller == motherTongueTextController &&
        sectCasteTextController.text.isEmpty) {
      onClickSectCaste();
    } else if (controller == sectCasteTextController &&
        highestEducationTextController.text.isEmpty) {
      onClickHighestEducation();
    } else if (controller == highestEducationTextController &&
        employedInTextController.text.isEmpty) {
      onClickEmployedIn();
    } else if (controller == employedInTextController &&
        occupationTextController.text.isEmpty) {
      onClickOccupation();
    } else if (controller == occupationTextController &&
        annualIncomeTextController.text.isEmpty) {
      onClickAnnualIncome();
    } else if (maritalStatusTextController.text.isEmpty) {
      onClickMaritalStatus();
    } else if (motherTongueTextController.text.isEmpty) {
      onClickMotherTongue();
    } else if (sectCasteTextController.text.isEmpty) {
      onClickSectCaste();
    } else if (highestEducationTextController.text.isEmpty) {
      onClickHighestEducation();
    } else if (employedInTextController.text.isEmpty) {
      onClickEmployedIn();
    } else if (occupationTextController.text.isEmpty) {
      onClickOccupation();
    } else if (annualIncomeTextController.text.isEmpty) {
      onClickAnnualIncome();
    }
  }
}
