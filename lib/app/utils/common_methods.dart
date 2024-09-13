class CommonMethods {
  static String? commonValidation(String? value) {
    if (value != null && value.isEmpty) {
      return "The field can't be empty";
    }
    return null;
  }
}
