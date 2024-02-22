import 'package:pocket_clinic/utils/app_config.dart';

class AppFunctions {
  // static String timestampToDateTime(String timestamp) {
  //   var date = DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp) * 1000);
  //   final f = DateFormat('dd MMM yyyy hh:mm a');
  //   return f.format(date).toString();
  // }

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
