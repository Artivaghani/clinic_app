import 'dart:io';

class ApiUtils {
  static String get baseUrl =>
      'http://${Platform.isAndroid ? '10.0.2.2' : 'localhost'}:3000/';

  //endpoint
  static String login = "auth/login";
  static String visits = "visits";
  static String resources = "resources";
  static String addNote = "visits/task/complete";
  static String condition = "categories/condition";
  static String info = "categories/info";
  static String logout = "auth/logout";
}
