import 'package:pocket_clinic/screens/home_screen/home_screen.dart';
import 'package:pocket_clinic/screens/login_screen/login_screen.dart';
import 'package:pocket_clinic/utils/app_config.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  Future<double> whenNotZero(Stream<double> source) async {
    await for (double value in source) {
      if (value > 0) {
        return value;
      }
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: whenNotZero(
          Stream<double>.periodic(
              const Duration(milliseconds: 50), (x) => Get.height),
        ),
        builder: (BuildContext context, AsyncSnapshot<double> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data! > 0) {
              Future.delayed(
                const Duration(seconds: 3),
                () {
                  if (StorageHelper().isLoggedIn) {
                  Get.offUntil(GetPageRoute(page: () => const HomeScreen()),
                      (route) => false);
                  } else {
                    Get.off(LoginScreen());
                  }
                },
              );
              return splashData();
            } else {
              return splashData();
            }
          } else {
            return splashData();
          }
        });
  }

  splashData() => Scaffold(
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppImages.logo,
                ).paddingAll(Appdimens.dimen80),
              ],
            ),
          ),
        ),
      );
}
