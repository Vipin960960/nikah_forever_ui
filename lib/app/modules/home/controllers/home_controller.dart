import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nikah_forever_ui/app/constants/app_form_list_data.dart';

import '../../../app_widgets/app_text_style.dart';
import '../../../app_widgets/common_pop_up.dart';
import '../../../constants/app_colors.dart';

class HomeController extends GetxController {
  late TextEditingController nameTextController;
  late TextEditingController dateOfBirthTextController;
  late TextEditingController heightTextController;
  late TextEditingController whereDoYouLiveTextController;
  late TextEditingController whereDoesYourFamilyLiveTextController;

  bool isLivingWithFamily = true;

  @override
  void onInit() {
    nameTextController = TextEditingController();
    dateOfBirthTextController = TextEditingController();
    heightTextController = TextEditingController();
    whereDoYouLiveTextController = TextEditingController();
    whereDoesYourFamilyLiveTextController = TextEditingController();

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
      widget: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 25),
            child: Row(
              children: [
                Text(
                  "Add Date of Birth",
                  style: AppTextStyle.bold(fontSize: 18),
                ),
                const Spacer(),
                InkWell(
                  onTap: Get.back,
                  child: const Icon(
                    Icons.close,
                    color: Colors.pink,
                    size: 30,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 350,
            child: DefaultTextStyle(
              style: AppTextStyle.regular(
                  fontSize: 10, color: AppColors.greyLight),
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                backgroundColor: AppColors.white,
                dateOrder: DatePickerDateOrder.dmy,
                onDateTimeChanged: (date) {
                  print(date);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onClickHeight() {
    CommonPopUp.showBottomSheetSearchAble(
      context: Get.context,
      list: AppFormListData.heightList,
      title: 'Select Height*',
      selectedValue: heightTextController.text,
      removeSearchBox: true,
      onTap: (value) {
        heightTextController.text = value;
      },
    );
  }

  void onClickWhereDoYouLive() {
    String selectedCountry = "";
    String selectedState = "";
    String selectedCity = "";

    String oldCountry = whereDoYouLiveTextController.text;
    if (oldCountry != "") {
      selectedCountry = oldCountry.split(", ")[0];
      selectedState = oldCountry.split(", ")[1];
      selectedCity = oldCountry.split(", ")[2];
    }
    CommonPopUp.showBottomSheetSearchAble(
      context: Get.context,
      bottomSheetHeight: Get.height * 0.7,
      list: AppFormListData.countryMap.keys.toList(),
      title: 'Select Country',
      selectedValue: selectedCountry,
      onTap: (country) async {
        // Selecting State
        await Future.delayed(const Duration(milliseconds: 100));
        CommonPopUp.showBottomSheetSearchAble(
          context: Get.context,
          bottomSheetHeight: Get.height * 0.7,
          list: AppFormListData.countryMap[country]!.keys.toList(),
          title: 'State in $country',
          selectedValue: selectedState,
          onTap: (state) async {
            // Selecting city
            await Future.delayed(const Duration(milliseconds: 100));
            CommonPopUp.showBottomSheetSearchAble(
              context: Get.context,
              bottomSheetHeight: Get.height * 0.7,
              list: AppFormListData.countryMap[country]![state]!,
              title: 'City in $state',
              selectedValue: selectedCity,
              onTap: (city) {
                whereDoYouLiveTextController.text = "$country, $state, $city";
              },
            );
          },
        );
      },
    );
  }

  void onClickWhereDoesYourFamilyLive() {
    String selectedCountry = "";
    String selectedState = "";
    String selectedCity = "";

    String oldCountry = whereDoesYourFamilyLiveTextController.text;
    if (oldCountry != "") {
      selectedCountry = oldCountry.split(", ")[0];
      selectedState = oldCountry.split(", ")[1];
      selectedCity = oldCountry.split(", ")[2];
    }
    CommonPopUp.showBottomSheetSearchAble(
      context: Get.context,
      bottomSheetHeight: Get.height * 0.7,
      list: AppFormListData.countryMap.keys.toList(),
      title: 'Select Country',
      selectedValue: selectedCountry,
      onTap: (country) async {
        // Selecting State
        await Future.delayed(const Duration(milliseconds: 100));
        CommonPopUp.showBottomSheetSearchAble(
          context: Get.context,
          bottomSheetHeight: Get.height * 0.7,
          list: AppFormListData.countryMap[country]!.keys.toList(),
          title: 'State in $country',
          selectedValue: selectedState,
          onTap: (state) async {
            // Selecting city
            await Future.delayed(const Duration(milliseconds: 100));
            CommonPopUp.showBottomSheetSearchAble(
              context: Get.context,
              bottomSheetHeight: Get.height * 0.7,
              list: AppFormListData.countryMap[country]![state]!,
              title: 'City in $state',
              selectedValue: selectedCity,
              onTap: (city) {
                whereDoesYourFamilyLiveTextController.text =
                    "$country, $state, $city";
              },
            );
          },
        );
      },
    );
  }

  void onClickYesButtonDoesYourFamilyLive() {}

  void onClickNoButtonDoesYourFamilyLive() {}
}
