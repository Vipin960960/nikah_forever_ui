import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nikah_forever_ui/app/constants/app_form_list_data.dart';
import 'package:nikah_forever_ui/app/constants/app_strings.dart';
import 'package:nikah_forever_ui/app/models/country_and_state_model.dart';

import '../../../app_widgets/choice_button.dart';
import '../../../models/city_of_state_model.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/common_api_client.dart';
import '../../../utils/common_methods.dart';
import '../../../utils/common_pop_up.dart';
import '../views/components/date_of_birth_pop_up.dart';

class BasicDetailController extends GetxController {
  final basicDetailFormKey = GlobalKey<FormState>();
  late ApiClient apiClient;

  late TextEditingController nameTextController;
  late TextEditingController dateOfBirthTextController;
  late TextEditingController heightTextController;
  late TextEditingController whereDoYouLiveTextController;
  late TextEditingController whereDoesYourFamilyLiveTextController;

  //isLivingWithFamily Value = 1 will be Yes, Value = 2 will be No, Value = 4 will be error
  RxInt isLivingWithFamily = 0.obs;

  RxBool isHittingApi = false.obs;

  late DateTime minDateOfBirth;
  late DateTime maxDateOfBirth;
  late DateTime selectedDateOfBirth;
  String male = "Male";
  String female = "Female";
  RxString selectedGender = "Male".obs;

  List<String> countriesList = [];
  List<String> citiesList = [];

  CountryAndStateModel? countryAndStateModel;
  @override
  void onInit() {
    if (Get.arguments != null) {
      countryAndStateModel = Get.arguments;
    }

    apiClient = ApiClient();

    nameTextController = TextEditingController();
    dateOfBirthTextController = TextEditingController();
    heightTextController = TextEditingController();
    whereDoYouLiveTextController = TextEditingController();
    whereDoesYourFamilyLiveTextController = TextEditingController();

    setGenderValidationOnDate(21);

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
    String date = dateOfBirthTextController.text;
    if (date.isNotEmpty) {
      // So that user will get old selected index item
      selectedDateOfBirth = DateTime(int.parse(date.split("-")[2]),
          int.parse(date.split("-")[1]), int.parse(date.split("-")[0]));
    }
    CommonPopUp.showBottomSheetCustom(
        context: Get.context,
        removeTopRounder: true,
        widget: const DateOfBirthPopUp());
  }

  void onClickHeight() {
    CommonPopUp.showBottomSheetList(
      context: Get.context,
      height: Get.height * 0.7,
      title: 'Select ${AppStrings.height}',
      list: AppFormListData.instance.heightList,
      selectedValue: heightTextController.text,
      removeSearchBox: true,
      onTap: (value) {
        heightTextController.text = value;
        callListWhichIsEmpty(heightTextController);
      },
    );
  }

  Future<void> onClickWhereDoYouLive(controller) async {
    if (countryAndStateModel == null) {
      await getCountryAndState();
    }

    countriesList =
        countryAndStateModel!.data!.map((value) => value.name!).toList();

    String selectedCountry = "";
    String selectedState = "";
    String selectedCity = "";

    String oldCountry = controller.text;
    if (oldCountry != "") {
      selectedCountry = oldCountry.split(", ")[0];
      selectedState = oldCountry.split(", ")[1];
      selectedCity = oldCountry.split(", ")[2];
    }

    // countriesList =
    //     AppFormListData.instance.countryMap.keys.toList();

    CommonPopUp.showBottomSheetList(
      context: Get.context,
      height: Get.height * 0.7,
      list: countriesList,
      title: 'Select Country',
      selectedValue: selectedCountry,
      onTap: (country) async {
        // Selecting State
        // List<String> statesList = AppFormListData.instance.countryMap[country]!.keys.toList();
        List<String> statesList =
            getStatesByCountryCode(countryAndStateModel!, country);
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

            await getCityOfState(country, state);
            citiesList.sort();
            await CommonMethods.timerForNextList();
            CommonPopUp.showBottomSheetList(
              context: Get.context,
              height: Get.height * 0.7,
              list: citiesList,
              title: 'City in $state',
              selectedValue: selectedCity,
              onTap: (city) {
                controller.text = "$country, $state, $city";
                callListWhichIsEmpty(controller);
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
    callListWhichIsEmpty(dateOfBirthTextController);
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
    } else {
      callListWhichIsEmpty(dateOfBirthTextController);
    }
  }

  Future<void> callListWhichIsEmpty(TextEditingController controller) async {
    await CommonMethods.timerForNextList();
    if (controller == dateOfBirthTextController &&
        heightTextController.text.isEmpty) {
      onClickHeight();
    } else if (controller == heightTextController &&
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

  ChoiceStatus getYesNoPressed(bool isYesButton) {
    return (isYesButton && isLivingWithFamily.value == 1) ||
            (!isYesButton && isLivingWithFamily.value == 2)
        ? ChoiceStatus.active
        : isLivingWithFamily.value == 4
            ? ChoiceStatus.error
            : ChoiceStatus.inactive;
  }

  void onChangeRadioButton(String? value) {
    selectedGender.value = value!;
    if (value == male) {
      setGenderValidationOnDate(21);
    } else if (value == female) {
      setGenderValidationOnDate(18);
    }
  }

  void setGenderValidationOnDate(int limit) {
    // Selecting date of birth
    final currentDate = DateTime.now();

    // Month & Day =1 so that user can go till january &  day 1 after selecting min year
    minDateOfBirth = DateTime(
      currentDate.year - 74,
      1,
      1,
    );
    // Month = 12 & Day = 31 so that user can go till december &  day 31 after selecting max year
    maxDateOfBirth = DateTime(
      currentDate.year - limit,
      12,
      31,
    );

    // Just to start from mid
    selectedDateOfBirth = DateTime(
      maxDateOfBirth.year - 3,
      currentDate.month,
      currentDate.day,
    );
  }

  List<String> getStatesByCountryCode(
      CountryAndStateModel data, String countryName) {
    List<CountryStateData> countries = data.data!;

    for (var country in countries) {
      if (country.name == countryName) {
        return List<String>.from(
            country.states!.map((value) => value.name).toList());
      }
    }
    return [];
  }

  Future<void> getCountryAndState() async {
    final response = await apiClient.getCountriesAndState();

    if (response != null && response.data != null) {
      countryAndStateModel = CountryAndStateModel.fromJson(response.data);
    } else {
      CommonPopUp.showSnackBar(AppStrings.error,
          message: AppStrings.thereIsSomeError);
    }
  }

  Future<void> getCityOfState(String country, String state) async {
    final response = await apiClient.getCityOfState(state);

    if (response != null && response.data != null) {
      CityOfStateModel cityOfStateModel =
          CityOfStateModel.fromJson(response.data);
      citiesList =
          cityOfStateModel.data!.map((value) => value.cityName!).toList();
    } else {
      citiesList = AppFormListData.instance.countryMap[country]![state]!;

      CommonPopUp.showSnackBar(AppStrings.error,
          message: AppStrings.thereIsSomeError);
    }
  }
}
