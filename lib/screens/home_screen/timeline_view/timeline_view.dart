import 'package:pocket_clinic/screens/home_screen/home_container.dart';
import 'package:pocket_clinic/screens/home_screen/timeline_view/timeline_card/timeline_card.dart';
import 'package:pocket_clinic/utils/app_config.dart';
import 'package:pocket_clinic/widgets/app_btn.dart';

class TimeLineview extends StatelessWidget {
  TimeLineview({super.key});
  String newNote = '';

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return ListView(
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
              top: AppConst.isMobile ? Appdimens.dimen20 : Appdimens.dimen30),
          getVisistTitle(controller).paddingOnly(top: Appdimens.dimen20),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 2,
            itemBuilder: (context, index) => TimeLineCard(
              index: index,
            ),
          ).paddingOnly(top: Appdimens.dimen20)
        ],
      ).paddingAll(Appdimens.dimen20);
    });
  }

  Widget getVisistTitle(HomeController controller) => Container(
        width: double.infinity,
        height: AppConst.isMobile ? Appdimens.dimen50 : Appdimens.dimen60,
        decoration: BoxDecoration(
            color: AppColors.terneryColor,
            border: Border.all(color: AppColors.deviderColor, width: 2),
            borderRadius: BorderRadius.circular(30)),
        padding: EdgeInsets.symmetric(horizontal: Appdimens.dimen20),
        child: Row(
          children: [
            SizedBox(
              width: AppConst.isMobile ? Appdimens.dimen80 : Appdimens.dimen100,
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
                  controller.update();
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
                          controller.visitList[index],
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
                )
                    .paddingOnly(
                        right: AppConst.isMobile
                            ? Appdimens.dimen10
                            : Appdimens.dimen20)
                    .asButton(onTap: () {
                  controller.selectedVisit = index;
                  controller.update();
                }),
              ),
            )
          ],
        ),
      );

  Widget getTaskView(HomeController controller) => Container(
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
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => taskCard(),
            ).paddingOnly(
                    bottom: Appdimens.dimen10,
                    left: Appdimens.dimen10,
                    top: Appdimens.dimen10))
          ],
        ),
      );

  taskCard() => Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: AppColors.redColor,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 3,
        child: Container(
          width: AppConst.isMobile ? Appdimens.dimen360 : Appdimens.dimen450,
          color: AppColors.terneryColor,
          margin: EdgeInsets.only(left: Appdimens.dimen20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: Appdimens.dimen16,
                        width: Appdimens.dimen16,
                        decoration: const BoxDecoration(
                            color: AppColors.redColor, shape: BoxShape.circle),
                      ),
                      Text(
                        'Pending',
                        style: Get.theme.textTheme.labelMedium!.copyWith(
                            color: AppColors.redColor,
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
                        'Jan 31, 2024',
                        style: Get.theme.textTheme.labelMedium!.copyWith(
                            color: AppColors.greyColor,
                            fontWeight: FontWeight.w500),
                      ).paddingOnly(left: Appdimens.dimen6),
                    ],
                  ),
                ],
              ),
              Text(
                'Schedule a follow-up appointment for a COVID-19 vaccine booster shot at Walgreen Co.',
                maxLines: 2,
                style: Get.theme.textTheme.labelMedium!
                    .copyWith(color: AppColors.secondaryColor),
              ).paddingOnly(
                  top: AppConst.isMobile
                      ? Appdimens.dimen10
                      : Appdimens.dimen20),
              AppTextField(
                height:
                    AppConst.isMobile ? Appdimens.dimen40 : Appdimens.dimen50,
                hintText: AppStrings.addNote,
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.deviderColor, width: 2),
                    borderRadius: BorderRadius.circular(10)),
                prefixIcon: Image.asset(AppImages.pin).paddingAll(
                    AppConst.isMobile ? Appdimens.dimen8 : Appdimens.dimen14),
                contentPadding: EdgeInsets.symmetric(
                    vertical: AppConst.isMobile
                        ? Appdimens.dimen14
                        : Appdimens.dimen22,
                    horizontal: Appdimens.dimen20),
                onChanged: (p0) {
                  newNote = p0;
                },
                onTap: () {},
              ).paddingSymmetric(
                  vertical:
                      AppConst.isMobile ? Appdimens.dimen2 : Appdimens.dimen10),
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Image.asset(
                          AppImages.doctor,
                          height: Appdimens.dimen16,
                        ),
                        Expanded(
                          child: Text(
                            'Dr. Javier · UCSF Health',
                            overflow: TextOverflow.ellipsis,
                            style: Get.theme.textTheme.labelMedium!.copyWith(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.w500),
                          ).paddingOnly(left: Appdimens.dimen6),
                        ),
                      ],
                    ),
                  ),
                  appButton(
                    AppStrings.markAsDone,
                    style: Get.theme.textTheme.labelMedium!.copyWith(
                        color: AppColors.terneryColor,
                        fontWeight: FontWeight.w500),
                    height: AppConst.isMobile
                        ? Appdimens.dimen50
                        : Appdimens.dimen50,
                    onTap: () {},
                  ).paddingOnly(left: Appdimens.dimen4)
                ],
              ).paddingOnly(top: Appdimens.dimen14)
            ],
          ).paddingAll(
              AppConst.isMobile ? Appdimens.dimen14 : Appdimens.dimen20),
        ),
      ).paddingOnly(right: Appdimens.dimen10);

  getTaskTitle(HomeController controller) {
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
            Row(
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
                  decoration: BoxDecoration(
                      color: index == controller.selectedTask
                          ? AppColors.primaryColor
                          : AppColors.greyColor,
                      shape: BoxShape.circle),
                  padding: EdgeInsets.all(Appdimens.dimen8),
                  margin: EdgeInsets.only(left: Appdimens.dimen4),
                  child: Text(
                    controller.taskList[index]['count'].toString(),
                    style: Get.theme.textTheme.titleLarge!
                        .copyWith(fontSize: FontDimen.dimen10),
                  ),
                )
              ],
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
          onTap: () {
            controller.selectedTask = index;
            controller.update();
          },
        ),
      ),
    );
  }
}
