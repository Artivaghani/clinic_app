import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:pocket_clinic/api_helpers/api_utils.dart';
import 'package:pocket_clinic/utils/app_config.dart';
import 'package:pocket_clinic/utils/app_function.dart';

class ApiManager {
  static Future<Map<String, dynamic>> callPost(
      Map<String, String> body, String endPoint) async {
    bool isNet = await AppFunctions.checkInternet();
    if (isNet) {
      try {
        Map<String, dynamic> finalresponse;
        Uri url = Uri.parse('${ApiUtils.baseUrl}$endPoint');
       
        http.Response response = await http.post(url, body: json.encode(body));
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
    } else {
      throw AppStrings.errorMsg;
    }
  }
}
