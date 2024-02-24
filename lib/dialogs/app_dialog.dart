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

  static showCommonDialog(
    Widget child,
  ) {
    showDialog(
      barrierDismissible: false,
      context: Get.context!,
      builder: (BuildContext context) {
        return PopScope(
          canPop: false,
          child: Dialog(
            insetPadding: AppConst.isMobile
                ? EdgeInsets.symmetric(
                    vertical: Appdimens.dimen50,
                    horizontal: Appdimens.dimen50)
                : EdgeInsets.symmetric(
                    vertical: Appdimens.dimen50,
                    horizontal: Appdimens.dimen200),
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)), //this right here
            child: Container(
                decoration:
                    AppDecoration.cardDecoration(color: AppColors.terneryColor),
                padding: EdgeInsets.all(Appdimens.dimen20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    child,
                    appButton(
                      AppStrings.close,
                      width: Appdimens.dimen200,
                      height: Appdimens.dimen50,
                      style: Get.theme.textTheme.bodySmall,
                      onTap: () => Get.back(),
                    ).paddingOnly(top: Appdimens.dimen20)
                  ],
                )),
          ),
        );
      },
    );
  }
}
