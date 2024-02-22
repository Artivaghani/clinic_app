import 'package:pocket_clinic/utils/app_config.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppWidgets.titleBar(),
      body: AppWidgets.datanotfoundtext(title: 'Help'),
    );
  }
}
