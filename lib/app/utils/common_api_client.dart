import 'package:dio/dio.dart' as dio_package;
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../constants/api_constant.dart';
import '../constants/app_strings.dart';
import 'common_pop_up.dart';

class ApiClient {
  var dio = dio_package.Dio();

  ///This api client is small because i just focused on Functionality
  Future<dio_package.Response?> getAPI(path,
      {Map<String, dynamic>? headers}) async {
    var response = await dio.request(
      path,
      options: dio_package.Options(
        method: 'GET',
        headers: headers,
      ),
    );
    if (response.statusCode == 200) {
      return response;
    } else {
      CommonPopUp.showSnackBar(AppStrings.error,
          message: AppStrings.somethingWentWrong);
      if (kDebugMode) {
        print(response.statusMessage);
      }
      return null;
    }
  }

  Future<dio_package.Response?> getCountriesAndState() async {
    final response = await getAPI(ApiConstants.countryAndStateAPi);
    return response;
  }

  Future<dio_package.Response?> getCityOfState(String state) async {
    var headers = {
      'api-token': AppStrings.apiToken,
      'user-email': AppStrings.apiEmail
    };

    Get.context!.loaderOverlay.show();
    var responseAccessToken =
        await getAPI(ApiConstants.getAccessToken, headers: headers);

    if (responseAccessToken != null) {
      headers = {
        'Authorization': 'Bearer ${responseAccessToken.data["auth_token"]}'
      };
      String path = "${ApiConstants.getCitiesList}$state";
      var response = await getAPI(path, headers: headers);
      Get.context!.loaderOverlay.hide();
      return response;
    } else {
      Get.context!.loaderOverlay.hide();
      return null;
    }
  }
}
