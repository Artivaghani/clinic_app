import 'dart:io';

import 'package:flutter/foundation.dart';

class ApiUtils {
  // static String get baseUrl =>
  //     'https://6fc6-2401-4900-3b1b-36dc-9877-a668-d06e-5188.ngrok-free.app/';
  static String get baseUrl => kIsWeb
      ? 'http://localhost:3000/'
      : 'http://${Platform.isAndroid ? '10.0.2.2' : 'localhost'}:3000/';

  //endpoint
  static String login = "auth/login";
  static String visits = "visits";
  static String resources = "resources";
  static String addNote = "visits/task/complete";
  static String condition = "categories/condition";
  static String info = "categories/info";
  static String logout = "auth/logout";
}
