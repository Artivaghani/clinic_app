

import 'package:pocket_clinic/utils/app_config.dart';

class AppValidation {
  static String? validatesPassword(String? value) {
    String pattern =
        r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$';
    RegExp regExp = RegExp(pattern);
    if (value!.isEmpty) {
      return AppStrings.fieldIsRequired;
    } else if (!regExp.hasMatch(value)) {
      return AppStrings.validatePasswordMsg;
    }

    return null;
  }

  static String? validatesEmail(String? value) {
    String pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regExp = RegExp(pattern);
    if (value!.isEmpty) {
      return AppStrings.fieldIsRequired;
    } else if (!regExp.hasMatch(value)) {
      return AppStrings.validateEmailMsg;
    }

    return null;
  }

  static String? validatesCPassWord(String? value, String? oldPass) {
    if (value!.isEmpty) {
      return AppStrings.fieldIsRequired;
    } else if (!(value == oldPass)) {
      return AppStrings.validateCPassMsg;
    }

    return null;
  }

  static String? checkEmpty(String? value) {
    if (value!.isEmpty) {
      return AppStrings.fieldIsRequired;
    } 

    return null;
  }
}
