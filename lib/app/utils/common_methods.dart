import 'package:nikah_forever_ui/app/constants/app_strings.dart';

class CommonMethods {
  static String? commonValidation(String? value) {
    if (value != null && value.isEmpty) {
      return AppStrings.fieldCanNotBeEmpty;
    }
    return null;
  }

  static Future<void> timerForNextList() async {
    await Future.delayed(const Duration(milliseconds: 100));
  }
}
