import 'package:pocket_clinic/utils/app_config.dart';

Future<void> main() async {
  await AppHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appname,
      theme: AppTheme.light,
      builder: (context, child) {
        return MediaQuery(
            data: MediaQuery.of(context).copyWith(
                textScaler: TextScaler.linear(FontDimen.textScaleFactor)),
            child: child!);
      },
      home: const SplashScreen(),
    );
  }
}
