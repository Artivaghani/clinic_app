import 'package:pocket_clinic/api_helpers/api_manager.dart';
import 'package:pocket_clinic/api_helpers/api_param.dart';
import 'package:pocket_clinic/api_helpers/api_utils.dart';
import 'package:pocket_clinic/screens/home_screen/home_screen.dart';
import 'package:pocket_clinic/utils/app_config.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  login() {
    if (formKey.currentState!.validate()) {
      AppDialogs.showProcess();
      ApiManager.callPost({ApiParam.email: email.text}, ApiUtils.login,
          headers: {
            'Content-Type': 'application/json',
          }).then((value) {
        StorageHelper().saveToken = value['accessToken'].toString();
        StorageHelper().isLoggedIn = true;
        Get.offAll(() => const HomeScreen());
        AppDialogs.successSnackBar(AppStrings.loginSuccess);
      }).onError((error, stackTrace) {
        Get.back();
        AppDialogs.errorSnackBar(error.toString());
      });
    }
  }
}
