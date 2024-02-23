import 'package:intl/intl.dart';
import 'package:pocket_clinic/api_helpers/api_manager.dart';
import 'package:pocket_clinic/api_helpers/api_param.dart';
import 'package:pocket_clinic/api_helpers/api_utils.dart';
import 'package:pocket_clinic/screens/home_screen/timeline_view/model/visit_model.dart';
import 'package:pocket_clinic/utils/app_config.dart';

class TimeLineController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isLoading = true;
  List<VisitData> visitDataList = [];
  List<VisitData> allVisitDataList = [];
  List<ValidatedTasksForUser> taskDataList = [];
  List<ValidatedTasksForUser> allTaskDataList = [];

  List<Map> taskList = [
    {'title': 'All tasks', 'count': '0'},
    {'title': 'Pending tasks', 'count': '0'},
    {'title': 'Completed tasks', 'count': '0'}
  ];

  int selectedTask = 0;

  Set<String> yearList = {};
  String selectedYear = '2024';

  Set<String> visitList = {};

  int selectedVisit = 0;

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  void getData() {
    ApiManager.callGet(ApiUtils.visits).then((value) {
      VisitModel visitModel = VisitModel.fromJson(value);
      visitDataList = visitModel.data ?? [];
      allVisitDataList = visitDataList;
      taskDataList = [];
      yearList = {};
      visitList = {};
      for (var mainElement in visitDataList) {
        if (mainElement.validatedLongSummary != null &&
            mainElement.validatedShortSummary != null) {
          for (var element in (mainElement.validatedTasksForUser ?? [])) {
            ValidatedTasksForUser task = element;
            task.sId = mainElement.sId ?? '';
            task.dateStart = mainElement.dateStart ?? '';
            task.npi1 = mainElement.npi1 ?? '';
            task.npi2 = mainElement.npi2 ?? '';
            taskDataList.add(task);
          }
          String year = DateFormat("yyyy")
              .format(DateTime.parse(mainElement.dateStart.toString()));

          yearList.add(year);
          visitList.add(mainElement.visitType ?? '');
        }
      }
      selectedYear = yearList.first;

      taskList = [
        {'title': 'All tasks', 'count': taskDataList.length.toString()},
        {
          'title': 'Pending tasks',
          'count': taskDataList
              .where((element) => element.status == 'pending')
              .toList()
              .length
              .toString()
        },
        {
          'title': 'Completed tasks',
          'count': taskDataList
              .where((element) => element.status != 'pending')
              .toList()
              .length
              .toString()
        }
      ];
      allTaskDataList = taskDataList;
      changeTaskTab(selectedTask);

      isLoading = false;
      update();
    }).onError((error, stackTrace) {
      isLoading = false;
      update();
      AppDialogs.errorSnackBar(error.toString());
    });
  }

  changeTaskTab(int index) {
    selectedTask = index;
    if (selectedTask == 0) {
      taskDataList = allTaskDataList;
    } else if (selectedTask == 1) {
      taskDataList = allTaskDataList
          .where((element) => element.status == 'pending')
          .toList();
    } else {
      taskDataList = allTaskDataList
          .where((element) => element.status != 'pending')
          .toList();
    }
    update();
  }

  callAddNote(TextEditingController newNote, String id, String sId) {
    AppDialogs.showProcess();
    ApiManager.callPost(
      {
        ApiParam.taskId: id,
        ApiParam.visitId: sId,
        ApiParam.note: newNote.text,
      },
      ApiUtils.addNote,
    ).then((value) {
      Get.back();
      newNote.clear();
      print(value.toString());
      getData();
      AppDialogs.successSnackBar(value['message'].toString());
    }).onError((error, stackTrace) {
      Get.back();
      AppDialogs.errorSnackBar(error.toString());
    });
  }

  void filterValue() {
    if (selectedVisit == 0) {
      visitDataList = allVisitDataList
          .where((element) => element.dateStart!.contains(selectedYear))
          .toList();
    } else {
      visitDataList = allVisitDataList
          .where((element) =>
              element.dateStart!.contains(selectedYear) &&
              element.visitType!.contains(visitList.elementAt(selectedVisit)))
          .toList();
    }

    update();
  }
}
