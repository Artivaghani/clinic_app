import 'package:pocket_clinic/screens/home_screen/category_view/condition_view.dart';
import 'package:pocket_clinic/utils/app_config.dart';

class HomeController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isTimeline = true;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  List<Map> taskList = [
    {'title': 'All tasks', 'count': '5'},
    {'title': 'Pending tasks', 'count': '5'},
    {'title': 'Completed tasks', 'count': '5'}
  ];

  int selectedTask = 0;

  List<String> yearList = ['2024', '2023'];
  String selectedYear = '2024';

  List<String> visitList = [
    'All Visits',
    'Outpatient',
    'Diagnostic Report',
    'Immunization',
    'Medication Request',
    'Document Reference',
    'Surgery'
  ];

  List<Map> catList = [
    {'title': 'Conditions', 'img': AppImages.con},
    {'title': 'Labs', 'img': AppImages.lab},
    {'title': 'Procedures', 'img': AppImages.pro},
    {'title': 'Allergies', 'img': AppImages.all},
    {'title': 'Immunizations', 'img': AppImages.imu},
    {'title': 'Medications', 'img': AppImages.medi},
    {'title': 'Vitals', 'img': AppImages.vit},
  ];

  int selectedVisit = 0;
  int selectedCat = 0;

  List<Widget> catViewList = [
    const ConditionView(),
    Container(),
    Container(),
    Container(),
    Container(),
    Container(),
    Container(),
  ];

  changeTab(bool value) {
    isTimeline = value;
    update();
  }

  changeCat(int index) {
    selectedCat = index;
    update();
  }
}
