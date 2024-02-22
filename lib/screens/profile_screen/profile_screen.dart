import 'package:pocket_clinic/utils/app_config.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppWidgets.titleBar(),
      body: AppWidgets.datanotfoundtext(title: 'Profile'),);
  }
}