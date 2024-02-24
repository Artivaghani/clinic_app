import 'package:intl/intl.dart';
import 'package:pocket_clinic/api_helpers/api_manager.dart';
import 'package:pocket_clinic/api_helpers/api_utils.dart';
import 'package:pocket_clinic/screens/login_screen/login_screen.dart';
import 'package:pocket_clinic/utils/app_config.dart';

class AppFunctions {
  static String getDateTime(String value) {
    var date = DateTime.parse(value);
    final f = DateFormat('MMM dd, yyyy');
    return f.format(date).toString();
  }

  static logout() async {
    AppDialogs.showProcess();
    ApiManager.callPost({}, ApiUtils.logout).then((value) async {
      Get.back();
      StorageHelper().removeUser();
      await Get.deleteAll();
      Get.offAll(() => LoginScreen());
    }).onError((error, stackTrace) {
      Get.back();
      AppDialogs.errorSnackBar(error.toString());
    });
  }

  static Future<bool> checkInternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }

    return false;
  }
}
