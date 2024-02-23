import 'package:get_storage/get_storage.dart';
import 'package:pocket_clinic/screens/login_screen/login_screen.dart';
import 'package:pocket_clinic/utils/app_config.dart';

class StorageHelper {
  get storage => GetStorage();

  removeUser() {
    storage.remove('isLoggedIn');
    storage.remove('accessToken');
    Get.offAll(() => LoginScreen());
  }

  set isLoggedIn(bool value) => storage.write("isLoggedIn", value);
  bool get isLoggedIn => storage.read('isLoggedIn') ?? false;

  set saveToken(String value) => storage.write("accessToken", value);
  String get getToken => storage.read('accessToken') ?? '';

  // set loginData(LoginData data) =>
  //     storage.write("loginData", json.encode(data));

  // LoginData get loginData {
  //   final parsed = json.decode(storage.read("loginData") ?? "{}");
  //   return LoginData.fromJson(parsed);
  // }

  // set saveFavoriteData(List<PromptList> data) => storage.write("favoriteList",
  //     json.encode(List<dynamic>.from(data.map((x) => x.toJson()))));

  // List<PromptList> get getFavoriteData {
  //   List<dynamic> parsed = json.decode(storage.read("favoriteList") ?? '[]');

  //   List<PromptList> newList = [];
  //   for (var element in parsed) {
  //     newList.add(PromptList.fromJson(element));
  //   }

  //   return newList;
  // }

  // set saveFavoriteDataProposal(List<PromptList> data) => storage.write(
  //     "favoriteListproposal",
  //     json.encode(List<dynamic>.from(data.map((x) => x.toJson()))));

  // List<PromptList> get getFavoriteDataProposal {
  //   List<dynamic> parsed =
  //       json.decode(storage.read("favoriteListproposal") ?? '[]');

  //   List<PromptList> newList = [];
  //   for (var element in parsed) {
  //     newList.add(PromptList.fromJson(element));
  //   }

  //   return newList;
  // }
}
