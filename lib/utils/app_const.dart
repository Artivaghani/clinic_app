import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:pocket_clinic/utils/app_config.dart';

class AppConst {
  static const String appName = 'Pocket Clinic';

  static bool get isMobile => kIsWeb
      ? Appdimens.screenWidth < 800
          ? true
          : false
      : Platform.isAndroid || Platform.isIOS || Appdimens.screenWidth < 700;
}
