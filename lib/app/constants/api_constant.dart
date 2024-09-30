import 'package:get/get_rx/src/rx_types/rx_types.dart';

class ApiConstants {
  static RxBool isLoading = false.obs;

  static const baseURL = "https://countriesnow.space/api/v0.1/countries/";

  static const countryAndStateAPi = "${baseURL}states";
  static const cityOfStateApi = "${baseURL}state/cities";
  static const getAccessToken =
      'https://www.universal-tutorial.com/api/getaccesstoken';
  static const getCitiesList = 'https://www.universal-tutorial.com/api/cities/';
}
