import 'dart:io';
import 'package:flutter/foundation.dart';

class AppConst {
  static const String appName = 'Pocket Clinic';
  static bool get isMobile =>
      kIsWeb ? false : Platform.isAndroid || Platform.isIOS;
}
