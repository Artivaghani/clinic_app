import 'dart:io';

class AppConst {
  static const String appName = 'Pocket Clinic';
  static bool get isMobile => Platform.isAndroid || Platform.isIOS;
}
