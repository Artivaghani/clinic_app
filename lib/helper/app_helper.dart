import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pocket_clinic/utils/app_config.dart';
import 'package:window_manager/window_manager.dart';

class AppHelper {
  static init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await GetStorage.init();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
    ));

    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [
        SystemUiOverlay.top, // Shows Status bar and hides Navigation bar
      ],
    );

    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      await windowManager.ensureInitialized();

      WindowOptions windowOptions = const WindowOptions(
        size: Size(1200, 750),
        minimumSize: Size(1200, 750),
        center: true,
        fullScreen: true,
        backgroundColor: Colors.transparent,
        skipTaskbar: false,
        titleBarStyle: TitleBarStyle.hidden,
      );
      windowManager.waitUntilReadyToShow(windowOptions, () async {
        await windowManager.show();
        await windowManager.focus();
      });
    }
  }
}
