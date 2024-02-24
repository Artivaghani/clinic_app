import 'package:pocket_clinic/api_helpers/api_manager.dart';
import 'package:pocket_clinic/api_helpers/api_utils.dart';
import 'package:pocket_clinic/screens/home_screen/category_view/condition_view/condition_model.dart';
import 'package:pocket_clinic/utils/app_config.dart';

class ConditionController extends GetxController {
  bool isLoading = true;
  List<ConditionData> conData = [];

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  void getData() {
    ApiManager.callGet(ApiUtils.condition).then((value) {
      ConditionModel conditionModel = ConditionModel.fromJson(value);
      conData = conditionModel.data ?? [];
      isLoading = false;
      update();
    }).onError((error, stackTrace) {
      isLoading = false;
      update();
      AppDialogs.errorSnackBar(error.toString());
    });
  }

  void getInfo() {
    AppDialogs.showProcess();
    ApiManager.callGet(ApiUtils.info).then((value) {
      Get.back();

      AppDialogs.showCommonDialog(Text(
        value['data'],
        style: Get.theme.textTheme.titleSmall,
      ));
      isLoading = false;
      update();
    }).onError((error, stackTrace) {
      Get.back();
      AppDialogs.errorSnackBar(error.toString());
    });
  }
}
