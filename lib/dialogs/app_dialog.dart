import 'package:pocket_clinic/utils/app_config.dart';
class AppDialogs {
  static showProcess() {
    return Get.dialog(
      PopScope(
          canPop: false,
          child: AlertDialog(
            elevation: 0,
            backgroundColor: Colors.transparent,
            content: SizedBox(
                width: 30,
                height: 30,
                child: AppWidgets.processIntegrator(
                    color: AppColors.secondaryColor)),
          )),
      barrierDismissible: false,
    );
  }

  static successSnackBar(String msg) {
    return ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
          backgroundColor: AppColors.greenColor,
          content: Text(
            msg,
            style: TextStyle(
                fontSize: FontDimen.dimen14, color: AppColors.secondaryColor),
          )),
    );
  }

  static errorSnackBar(String msg) {
    return ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
          backgroundColor: AppColors.redColor,
          content: Text(
            msg,
            style: TextStyle(
                fontSize: FontDimen.dimen14, color: AppColors.terneryColor),
          )),
    );
  }
}
