import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nikah_forever_ui/app/constants/app_form_list_data.dart';

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
      title: 'Select Marital Status*',
      removeSearchBox: true,
      list: AppFormListData.instance.maritalStateList,
      selectedValue: maritalStatusTextController.text,
      onTap: (value) {
        maritalStatusTextController.text = value;
      },
    );
  }

  void onClickMotherTongue() {
    CommonPopUp.showBottomSheetList(
      context: Get.context,
      removeSearchBox: true,
      title: 'Select Mother Tongue*',
      list: AppFormListData.instance.motherTongueList,
      selectedValue: motherTongueTextController.text,
      onTap: (value) {
        motherTongueTextController.text = value;
      },
    );
  }

  void onClickSectCaste() {
    CommonPopUp.showBottomSheetList(
      context: Get.context,
      height: Get.height * 0.3,
      title: 'Select Sect*',
      removeSearchBox: true,
      list: AppFormListData.instance.sectCasteList,
      selectedValue: sectCasteTextController.text,
      onTap: (value) {
        sectCasteTextController.text = value;
      },
    );
  }

  void onClickMaslak() {
    CommonPopUp.showBottomSheetList(
      context: Get.context,
      title: 'Select Maslak',
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
      title: 'Select Highest Education*',
      removeSearchBox: true,
      list: AppFormListData.instance.highestEducationList,
      selectedValue: highestEducationTextController.text,
      onTap: (value) {
        highestEducationTextController.text = value;
      },
    );
  }

  void onClickEmployedIn() {
    CommonPopUp.showBottomSheetList(
      context: Get.context,
      title: 'Select Mother Tongue*',
      removeSearchBox: true,
      list: AppFormListData.instance.employedIdList,
      selectedValue: employedInTextController.text,
      onTap: (value) {
        employedInTextController.text = value;
      },
    );
  }

  void onClickOccupation() {
    CommonPopUp.showBottomSheetList(
      context: Get.context,
      title: 'Select Mother Tongue*',
      removeSearchBox: true,
      list: AppFormListData.instance.occupationList,
      selectedValue: occupationTextController.text,
      onTap: (value) {
        occupationTextController.text = value;
      },
    );
  }

  void onClickAnnualIncome() {
    CommonPopUp.showBottomSheetList(
      context: Get.context,
      height: Get.height * 0.7,
      title: 'Select Annual Income*',
      list: AppFormListData.instance.annualIncomeList,
      selectedValue: annualIncomeTextController.text,
      onTap: (value) {
        annualIncomeTextController.text = value;
      },
    );
  }

  Future<void> onClickNext() async {
    if (socialDetailFormKey.currentState!.validate()) {
      isHittingApi.value = true;
      await Future.delayed(const Duration(seconds: 2));
      isHittingApi.value = false;
    }
  }
}
