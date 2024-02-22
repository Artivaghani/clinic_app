import 'package:get_storage/get_storage.dart';

class StorageHelper {
  get storage => GetStorage();

  set saveTheme(bool value) => storage.write("isDark", value);
  bool? get getTheme => storage.read('isDark');

  removeUser() {
    storage.remove('isLoggedIn');
    storage.remove('loginData');
  }

  set isLoggedIn(bool value) => storage.write("isLoggedIn", value);
  bool get isLoggedIn => storage.read('isLoggedIn') ?? false;



  set isGetFree(bool value) => storage.write("isGetFree", value);
  bool get isGetFree => storage.read('isGetFree') ?? false;

  set saveAdDate(String value) => storage.write("adDate", value);
  String get getAdDate => storage.read('adDate') ?? '';

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
