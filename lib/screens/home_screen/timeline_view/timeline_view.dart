import 'package:pocket_clinic/screens/home_screen/timeline_view/model/visit_model.dart';
import 'package:pocket_clinic/screens/home_screen/timeline_view/timeline_card/timeline_card.dart';
import 'package:pocket_clinic/screens/home_screen/timeline_view/timeline_controller.dart';
import 'package:pocket_clinic/utils/app_config.dart';
import 'package:pocket_clinic/utils/app_function.dart';

class TimeLineview extends StatelessWidget {
  TimeLineview({super.key});
  final TextEditingController text = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TimeLineController>(
        init: TimeLineController(),
        builder: (controller) {
          return controller.isLoading
              ? AppWidgets.processIntegrator()
              : ListView(
                  shrinkWrap: true,
                  children: [
                    Text(
                      AppStrings.yourTasks,
                      style: Get.theme.textTheme.headlineLarge!,
                    ),
                    getTaskView(controller).paddingOnly(top: Appdimens.dimen20),
                    Text(
                      AppStrings.visits,
                      style: Get.theme.textTheme.headlineLarge!,
                    ).paddingOnly(
                        top: AppConst.isMobile
                            ? Appdimens.dimen20
                            : Appdimens.dimen30),
                    getVisistTitle(controller)
                        .paddingOnly(top: Appdimens.dimen20),
                    controller.visitDataList.isEmpty
                        ? AppWidgets.datanotfoundtext()
                            .paddingSymmetric(vertical: Appdimens.dimen100)
                        : ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.visitDataList.length,
                            itemBuilder: (context, index) => TimeLineCard(
                                index: index,
                                visitData: controller.visitDataList[index]),
                          ).paddingOnly(top: Appdimens.dimen20)
                  ],
                ).paddingAll(Appdimens.dimen20);
        });
  }

  Widget getVisistTitle(TimeLineController controller) => Container(
        width: double.infinity,
        height: AppConst.isMobile ? Appdimens.dimen50 : Appdimens.dimen60,
        decoration: BoxDecoration(
            color: AppColors.terneryColor,
            border: Border.all(color: AppColors.deviderColor, width: 2),
            borderRadius: BorderRadius.circular(30)),
        padding: EdgeInsets.symmetric(horizontal: Appdimens.dimen20),
        child: Row(
          children: [
            if (controller.yearList.isNotEmpty)
              SizedBox(
                width:
                    AppConst.isMobile ? Appdimens.dimen80 : Appdimens.dimen100,
                child: DropdownButtonFormField(
                  value: controller.selectedYear,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: controller.yearList.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    controller.selectedYear = newValue ?? '';
                    controller.filterValue();
                  },
                  decoration: const InputDecoration(
                      border: InputBorder.none, isDense: true),
                ),
              ),
            Container(
              height: double.infinity,
              width: 2,
              color: AppColors.deviderColor,
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.visitList.length,
                itemBuilder: (context, index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          controller.visitList.elementAt(index),
                          style: Get.theme.textTheme.labelMedium!.copyWith(
                              color: index == controller.selectedVisit
                                  ? AppColors.secondaryColor
                                  : AppColors.greyColor,
                              fontWeight: index == controller.selectedVisit
                                  ? FontWeight.w600
                                  : null),
                        ),
                      ),
                    ),
                    Container(
                      height: 3,
                      width: Appdimens.dimen100,
                      color: index == controller.selectedVisit
                          ? AppColors.primaryColor
                          : Colors.transparent,
                    ).paddingOnly(top: Appdimens.dimen4)
                  ],
                ).paddingOnly(right: Appdimens.dimen20).asButton(onTap: () {
                  controller.selectedVisit = index;
                  controller.filterValue();
                }),
              ).paddingOnly(left: Appdimens.dimen8),
            )
          ],
        ),
      );

  Widget getTaskView(TimeLineController controller) => Container(
        decoration: BoxDecoration(
            color: AppColors.deviderColor,
            borderRadius: BorderRadius.circular(20)),
        height: AppConst.isMobile ? Appdimens.dimen300 : Appdimens.dimen360,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getTaskTitle(controller),
            Expanded(
                child: ListView.builder(
              itemCount: controller.taskDataList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) =>
                  taskCard(controller.taskDataList[index], controller),
            ).paddingOnly(
                    bottom: Appdimens.dimen10,
                    left: Appdimens.dimen10,
                    top: Appdimens.dimen10))
          ],
        ),
      );

  taskCard(
    ValidatedTasksForUser taskDataList,
    TimeLineController controller,
  ) =>
      Builder(builder: (context) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: taskDataList.status == 'pending'
              ? AppColors.redColor
              : AppColors.greenColor,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          elevation: 3,
          child: Container(
            width: AppConst.isMobile ? Appdimens.dimen360 : Appdimens.dimen450,
            color: AppColors.terneryColor,
            margin: EdgeInsets.only(left: Appdimens.dimen20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: Appdimens.dimen16,
                          width: Appdimens.dimen16,
                          decoration: BoxDecoration(
                              color: taskDataList.status == 'pending'
                                  ? AppColors.redColor
                                  : AppColors.greenColor,
                              shape: BoxShape.circle),
                        ),
                        Text(
                          taskDataList.status ?? '',
                          style: Get.theme.textTheme.labelMedium!.copyWith(
                              color: taskDataList.status == 'pending'
                                  ? AppColors.redColor
                                  : AppColors.greenColor,
                              fontWeight: FontWeight.w600),
                        ).paddingOnly(left: Appdimens.dimen6),
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset(
                          AppImages.clock,
                          height: Appdimens.dimen20,
                          color: AppColors.greyColor,
                        ),
                        Text(
                          AppFunctions.getDateTime(
                              taskDataList.dateStart ?? ''),
                          style: Get.theme.textTheme.labelMedium!.copyWith(
                              color: AppColors.greyColor,
                              fontWeight: FontWeight.w500),
                        ).paddingOnly(left: Appdimens.dimen6),
                      ],
                    ),
                  ],
                ),
                Text(
                  taskDataList.task ?? '',
                  maxLines: 2,
                  style: Get.theme.textTheme.labelMedium!
                      .copyWith(color: AppColors.secondaryColor),
                ).paddingOnly(
                    top: AppConst.isMobile
                        ? Appdimens.dimen10
                        : Appdimens.dimen20),
                taskDataList.status == 'pending'
                    ? AppTextField(
                        controller: text,
                        height: AppConst.isMobile
                            ? Appdimens.dimen40
                            : Appdimens.dimen50,
                        hintText: AppStrings.addNote,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColors.deviderColor, width: 2),
                            borderRadius: BorderRadius.circular(10)),
                        prefixIcon: Image.asset(AppImages.pin).paddingAll(
                            AppConst.isMobile
                                ? Appdimens.dimen8
                                : Appdimens.dimen14),
                        contentPadding: EdgeInsets.zero,
                        onTap: () {},
                      ).paddingSymmetric(
                        vertical: AppConst.isMobile
                            ? Appdimens.dimen2
                            : Appdimens.dimen10)
                    : (taskDataList.note != null)
                        ? Row(
                            children: [
                              Image.asset(
                                AppImages.pin,
                                height: Appdimens.dimen20,
                                color: AppColors.greyColor,
                              ),
                              Expanded(
                                child: Text(
                                  taskDataList.note ?? '',
                                  style: Get.theme.textTheme.labelMedium!
                                      .copyWith(
                                          color: AppColors.secondaryColor
                                              .withOpacity(0.5),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12),
                                ).paddingOnly(left: Appdimens.dimen10),
                              ),
                            ],
                          ).paddingSymmetric(vertical: Appdimens.dimen10)
                        : const SizedBox(),
                if (taskDataList.npi1 != null || taskDataList.npi2 != null)
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              AppImages.doctor,
                              height: Appdimens.dimen14,
                            ).paddingOnly(top: Appdimens.dimen2),
                            Expanded(
                              child: Text(
                                '${taskDataList.npi1 != null ? taskDataList.npi1 ?? '' : ''} · ${taskDataList.npi2 != null ? taskDataList.npi2 ?? '' : ''}',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: Get.theme.textTheme.labelMedium!
                                    .copyWith(
                                        color: AppColors.primaryColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: FontDimen.dimen10),
                              ).paddingOnly(left: Appdimens.dimen6),
                            ),
                          ],
                        ),
                      ),
                      if (taskDataList.status == 'pending')
                        appButton(
                          AppStrings.markAsDone,
                          style: Get.theme.textTheme.labelMedium!.copyWith(
                              color: AppColors.terneryColor,
                              fontWeight: FontWeight.w500),
                          height: AppConst.isMobile
                              ? Appdimens.dimen50
                              : Appdimens.dimen50,
                          onTap: () => controller.callAddNote(text,
                              taskDataList.id ?? '', taskDataList.sId ?? ''),
                        ).paddingOnly(left: Appdimens.dimen4)
                    ],
                  ).paddingOnly(top: Appdimens.dimen14)
              ],
            ).paddingAll(
                AppConst.isMobile ? Appdimens.dimen14 : Appdimens.dimen20),
          ),
        ).paddingOnly(right: Appdimens.dimen10);
      });

  getTaskTitle(TimeLineController controller) {
    return Container(
      margin: EdgeInsets.all(Appdimens.dimen2),
      width: double.infinity,
      height: Appdimens.dimen50,
      padding: EdgeInsets.only(
          top: Appdimens.dimen10,
          left: AppConst.isMobile ? Appdimens.dimen12 : Appdimens.dimen30),
      decoration: const BoxDecoration(
          color: AppColors.terneryColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.taskList.length,
        itemBuilder: (context, index) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Appdimens.dimen30,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    controller.taskList[index]['title'],
                    style: Get.theme.textTheme.labelMedium!.copyWith(
                        color: index == controller.selectedTask
                            ? AppColors.secondaryColor
                            : AppColors.greyColor),
                  ),
                  Container(
                    width: Appdimens.dimen26,
                    height: Appdimens.dimen26,
                    decoration: BoxDecoration(
                        color: index == controller.selectedTask
                            ? AppColors.primaryColor
                            : AppColors.greyColor,
                        shape: BoxShape.circle),
                    padding: EdgeInsets.all(Appdimens.dimen6),
                    margin: EdgeInsets.only(left: Appdimens.dimen4),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        controller.taskList[index]['count'].toString(),
                        style: Get.theme.textTheme.titleLarge!
                            .copyWith(fontSize: FontDimen.dimen10),
                      ),
                    ),
                  )
                ],
              ),
            ),
            if (index == controller.selectedTask)
              Container(
                height: 3,
                width: Appdimens.dimen100,
                color: AppColors.primaryColor,
              ).paddingOnly(top: Appdimens.dimen4)
          ],
        )
            .paddingOnly(
                right:
                    AppConst.isMobile ? Appdimens.dimen10 : Appdimens.dimen30)
            .asButton(
              onTap: () => controller.changeTaskTab(index),
            ),
      ),
    );
  }
}
