// ignore_for_file: unnecessary_null_comparison, non_constant_identifier_names


class Validator {
  //email
  static String? validateEmail(String? value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty || !regex.hasMatch(value)) {
      //return AppConstants.errorEmail.tr;
    } else {
      return null;
    }
  }
  //phone number
 static String? MobileNumberValidation(
      String value,
      ) {
    if (value.trim().isEmpty) {
      //return AppConstants.enterYourMobileNumber.tr;
    }
    return null;
  }
  //username
  static String? validateUserName(String? value) {
    if (value!.isEmpty || value == null) {
      //return AppConstants.errorName.tr;
    }
    return null;
  }
}
