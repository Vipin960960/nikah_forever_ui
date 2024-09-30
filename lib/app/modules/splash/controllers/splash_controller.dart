import 'package:get/get.dart';

import '../../../constants/app_assets.dart';
import '../../../models/country_and_state_model.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/common_api_client.dart';

class SplashController extends GetxController {
  late ApiClient apiClient;
  CountryAndStateModel? countryAndStateModel;

  String image = AppAssetsImage.icLauncher;

  @override
  void onReady() {
    apiClient = ApiClient();
    getCountryAndState();
    super.onReady();
  }

  Future<void> getCountryAndState() async {
    final response = await apiClient.getCountriesAndState();
    countryAndStateModel = CountryAndStateModel.fromJson(response!.data);
    Get.offNamed(Routes.BASIC_DETAILS, arguments: countryAndStateModel);
  }
}
