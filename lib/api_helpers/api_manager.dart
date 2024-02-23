import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:pocket_clinic/api_helpers/api_utils.dart';
import 'package:pocket_clinic/utils/app_config.dart';
import 'package:pocket_clinic/utils/app_function.dart';

class ApiManager {
  static Future<Map<String, dynamic>> callPost(
      Map<String, String> body, String endPoint,
      {Map<String, String>? headers}) async {
    bool isNet = await AppFunctions.checkInternet();
    if (isNet) {
      try {
        Map<String, dynamic> finalresponse;
        Uri url = Uri.parse('${ApiUtils.baseUrl}$endPoint');

        http.Response response = await http.post(url,
            body: json.encode(body),
            headers: headers ??
                {
                  'Content-Type': 'application/json',
                  'Authorization': 'Bearer ${StorageHelper().getToken}'
                });
        finalresponse = checkResponse(response);
        return finalresponse;
      } on SocketException catch (_) {
        throw AppStrings.checkConnection;
      }
    } else {
      throw AppStrings.checkConnection;
    }
  }

  static Future<Map<String, dynamic>> callGet(String endPoint,
      {Map<String, String>? headers}) async {
    bool isNet = await AppFunctions.checkInternet();
    if (isNet) {
      try {
        Map<String, dynamic> finalresponse;
        Uri url = Uri.parse('${ApiUtils.baseUrl}$endPoint');

        http.Response response = await http.get(url,
            headers: headers ??
                {
                  'Content-Type': 'application/json',
                  'Authorization': 'Bearer ${StorageHelper().getToken}'
                });
        finalresponse = checkResponse(response);
        return finalresponse;
      } on SocketException catch (_) {
        throw AppStrings.checkConnection;
      }
    } else {
      throw AppStrings.checkConnection;
    }
  }

  static Map<String, dynamic> checkResponse(http.Response response) {
    Map<String, dynamic> data = json.decode(response.body);
    if (response.statusCode == 200) {
      return data;
    } else if (response.statusCode == 401) {
      StorageHelper().removeUser();
      
      throw data['message'];
    } else {
      throw AppStrings.errorMsg;
    }
  }
}
