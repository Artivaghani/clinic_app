import 'package:intl/intl.dart';
import 'package:pocket_clinic/utils/app_config.dart';

class AppFunctions {
  static String getDateTime(String value) {
    var date = DateTime.parse(value);
    final f = DateFormat('MMM dd, yyyy');
    return f.format(date).toString();
  }

  static logout() async {
    StorageHelper().removeUser();

    await Get.deleteAll();
    // Get.offUntil(
    //     GetPageRoute(
    //         page: () => LoginScreen(
    //               isBack: false,
    //             )),
    //     (route) => false);
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
