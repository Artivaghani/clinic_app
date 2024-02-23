import 'package:pocket_clinic/api_helpers/api_manager.dart';
import 'package:pocket_clinic/api_helpers/api_utils.dart';
import 'package:pocket_clinic/screens/home_screen/timeline_view/model/resource_model.dart';
import 'package:pocket_clinic/utils/app_config.dart';

class TimelineCardController extends GetxController {
  bool isExpand = false;
  ResData? resData;

  init(List<String>? documentReference) {
    if (documentReference != null) {
      ApiManager.callGet(ApiUtils.resources).then((value) {
        ResourceModel resourceModel = ResourceModel.fromJson(value);
        for (ResData element in (resourceModel.data ?? [])) {
          if (element.id == documentReference[0]) {
            resData = element;
           
          }
        }
        update();
      }).onError((error, stackTrace) {
        update();
      });
    }
  }
}
