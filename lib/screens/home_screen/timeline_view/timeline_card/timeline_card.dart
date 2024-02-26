import 'package:flutter_html/flutter_html.dart';
import 'package:pocket_clinic/screens/home_screen/timeline_view/model/visit_model.dart';
import 'package:pocket_clinic/screens/home_screen/timeline_view/timeline_card/timeline_controller.dart';
import 'package:pocket_clinic/utils/app_config.dart';
import 'package:pocket_clinic/utils/app_function.dart';

class TimeLineCard extends StatelessWidget {
  final int index;
  final VisitData visitData;
  const TimeLineCard({super.key, required this.index, required this.visitData});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: TimelineCardController()
          ..init(visitData.resources?.documentReference),
        tag: index.toString(),
        builder: (controller) {
          return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: AppColors.primaryColor,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              elevation: 4,
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(AppConst.isMobile
                        ? Appdimens.dimen20
                        : Appdimens.dimen30),
                    decoration: BoxDecoration(
                        color: AppColors.terneryColor,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(Appdimens.dimen20),
                            bottomRight: Radius.circular(Appdimens.dimen20))),
                    child: AppConst.isMobile
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              leftView(controller),
                              if (controller.isExpand) sideView(),
                              if (!controller.isExpand)
                                taskCountView()
                                    .paddingOnly(top: Appdimens.dimen30)
                            ],
                          )
                        : Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: leftView(controller),
                              ),
                              SizedBox(
                                width: Appdimens.dimen20,
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    if (controller.isExpand) sideView(),
                                    if (!controller.isExpand) taskCountView()
                                  ],
                                ),
                              )
                            ],
                          ),
                  ),
                  Text(
                    controller.isExpand
                        ? AppStrings.compress.toUpperCase()
                        : AppStrings.expand.toUpperCase(),
                    style: Get.theme.textTheme.bodySmall!
                        .copyWith(fontWeight: FontWeight.w700),
                  ).paddingSymmetric(vertical: Appdimens.dimen14).asButton(
                      onTap: () {
                    controller.isExpand = !controller.isExpand;
                    controller.update();
                  })
                ],
              ));
        });
  }

  leftView(TimelineCardController controller) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            visitData.visitType ?? '',
            style: Get.theme.textTheme.bodyLarge!,
          ).paddingOnly(bottom: Appdimens.dimen10),
          Row(
            children: [
              Image.asset(
                AppImages.clock,
                height: Appdimens.dimen20,
              ),
              Text(
                AppFunctions.getDateTime(visitData.dateStart ?? ''),
                style: Get.theme.textTheme.labelMedium!.copyWith(
                    color: AppColors.primaryColor, fontWeight: FontWeight.w500),
              ).paddingOnly(left: Appdimens.dimen10),
            ],
          ).paddingSymmetric(vertical: Appdimens.dimen10),
          if (visitData.npi1 != null || visitData.npi2 != null)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  AppImages.doctor,
                  height: Appdimens.dimen20,
                ).paddingOnly(top: Appdimens.dimen2),
                Expanded(
                  child: Text(
                    '${visitData.npi1 != null ? visitData.npi1 ?? '' : ''} · ${visitData.npi2 != null ? visitData.npi2 ?? '' : ''}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Get.theme.textTheme.labelMedium!.copyWith(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w500),
                  ).paddingOnly(left: Appdimens.dimen10),
                ),
              ],
            ),
          if (controller.isExpand &&
              (visitData.validatedLongSummary != null &&
                  visitData.validatedLongSummary!.isNotEmpty))
            Text(
              'Visit Summary',
              style: Get.theme.textTheme.headlineMedium!,
            ).paddingOnly(top: Appdimens.dimen30, bottom: Appdimens.dimen10),
          Html(
            data: controller.isExpand
                ? visitData.validatedLongSummary
                : visitData.validatedShortSummary,
            style: {
              "body": Style(
                  margin: Margins.all(0),
                  fontSize: FontSize(14),
                  fontWeight: FontWeight.w400,
                  color: AppColors.secondaryColor),
            },
          ).paddingOnly(top: controller.isExpand ? 0 : Appdimens.dimen10),
          if (controller.isExpand && controller.resData != null)
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: AppColors.primaryColor, width: 2),
                      borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.symmetric(
                      vertical: Appdimens.dimen8,
                      horizontal: Appdimens.dimen20),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        AppImages.file,
                        height: Appdimens.dimen30,
                      ),
                      Text(
                        controller.resData?.idm?.practioner ?? '',
                        style: Get.theme.textTheme.labelSmall!,
                      ).paddingOnly(left: Appdimens.dimen6)
                    ],
                  ),
                ).paddingOnly(top: Appdimens.dimen20),
                Text(
                  controller.resData?.idm?.data ?? '',
                  style: Get.theme.textTheme.labelSmall!,
                ).paddingOnly(top: Appdimens.dimen10)
              ],
            ),
        ],
      );

  sideView() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (visitData.validatedTasksForUser!.isNotEmpty)
            Row(
              children: [
                Text(
                  AppStrings.yourTasks,
                  style: Get.theme.textTheme.headlineMedium!,
                ),
                Image.asset(
                  AppImages.list,
                  height: Appdimens.dimen20,
                ).paddingOnly(left: Appdimens.dimen10)
              ],
            ).paddingOnly(top: Appdimens.dimen30),
          AppConst.isMobile
              ? ListView.builder(
                  itemCount: visitData.validatedTasksForUser!.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) =>
                      taskCard(visitData.validatedTasksForUser![index]),
                ).paddingOnly(top: Appdimens.dimen10)
              : GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: visitData.validatedTasksForUser!.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio:
                          Appdimens.screenHeight < 800 ? 0.78 : 0.9,
                      crossAxisSpacing: Appdimens.dimen20,
                      mainAxisSpacing: Appdimens.dimen20,
                      crossAxisCount: 3),
                  itemBuilder: (context, index) =>
                      taskGridCard(visitData.validatedTasksForUser![index]),
                ).paddingOnly(top: Appdimens.dimen10),
          if (visitData.validatedInstructionsForUser!.isNotEmpty)
            Row(
              children: [
                Text(
                  AppStrings.instructions,
                  style: Get.theme.textTheme.headlineMedium!,
                ),
                Image.asset(
                  AppImages.star,
                  height: Appdimens.dimen20,
                ).paddingOnly(left: Appdimens.dimen10)
              ],
            ).paddingOnly(top: Appdimens.dimen30),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: visitData.validatedInstructionsForUser!.length,
            itemBuilder: (context, index) => Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '‣',
                  maxLines: 2,
                  style: Get.theme.textTheme.labelMedium!
                      .copyWith(color: AppColors.secondaryColor),
                ),
                Expanded(
                  child: Text(
                    visitData.validatedInstructionsForUser![index],
                    style: Get.theme.textTheme.labelMedium!
                        .copyWith(color: AppColors.secondaryColor),
                  ).paddingOnly(left: Appdimens.dimen10),
                ),
              ],
            ).paddingOnly(bottom: Appdimens.dimen10),
          ).paddingOnly(top: Appdimens.dimen10),
        ],
      );

  taskCard(ValidatedTasksForUser validatedTasksForUser) => Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: validatedTasksForUser.status == 'pending'
            ? AppColors.redColor
            : AppColors.greenColor,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 4,
        child: Container(
          color: AppColors.terneryColor,
          margin: EdgeInsets.only(left: Appdimens.dimen20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: Appdimens.dimen16,
                    width: Appdimens.dimen16,
                    decoration: BoxDecoration(
                        color: validatedTasksForUser.status == 'pending'
                            ? AppColors.redColor
                            : AppColors.greenColor,
                        shape: BoxShape.circle),
                  ),
                  Text(
                    validatedTasksForUser.status ?? '',
                    style: Get.theme.textTheme.labelMedium!.copyWith(
                        color: validatedTasksForUser.status == 'pending'
                            ? AppColors.redColor
                            : AppColors.greenColor,
                        fontWeight: FontWeight.w600),
                  ).paddingOnly(left: Appdimens.dimen6),
                ],
              ),
              Text(
                validatedTasksForUser.task ?? '',
                maxLines: 2,
                style: Get.theme.textTheme.labelMedium!
                    .copyWith(color: AppColors.secondaryColor),
              ).paddingOnly(top: Appdimens.dimen10),
              if (validatedTasksForUser.note != null &&
                  validatedTasksForUser.note!.isNotEmpty)
                Row(
                  children: [
                    Image.asset(
                      AppImages.pin,
                      height: Appdimens.dimen16,
                      color: AppColors.greyColor,
                    ),
                    Expanded(
                      child: Text(
                        validatedTasksForUser.note ?? '',
                        style: Get.theme.textTheme.labelMedium!.copyWith(
                            color: AppColors.secondaryColor.withOpacity(0.5),
                            fontWeight: FontWeight.w400,
                            fontSize: 12),
                      ).paddingOnly(left: Appdimens.dimen10),
                    ),
                  ],
                ).paddingSymmetric(vertical: Appdimens.dimen10),
              if (validatedTasksForUser.status == 'pending')
                appButton(AppStrings.markAsDone,
                        style: Get.theme.textTheme.labelMedium!.copyWith(
                            color: AppColors.terneryColor,
                            fontWeight: FontWeight.w500),
                        height: AppConst.isMobile
                            ? Appdimens.dimen40
                            : Appdimens.dimen50,
                        onTap: () {},
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(Appdimens.dimen20)))
                    .align(alignment: Alignment.bottomRight)
                    .paddingOnly(top: Appdimens.dimen10)
            ],
          ).paddingOnly(top: Appdimens.dimen14, left: Appdimens.dimen14),
        ),
      );

  taskGridCard(ValidatedTasksForUser validatedTasksForUser) => Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: (validatedTasksForUser.status == 'pending')
            ? AppColors.redColor
            : AppColors.greenColor,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 4,
        child: Container(
          color: AppColors.terneryColor,
          margin: EdgeInsets.only(top: Appdimens.dimen20),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: Appdimens.dimen16,
                          width: Appdimens.dimen16,
                          decoration: BoxDecoration(
                              color: (validatedTasksForUser.status == 'pending')
                                  ? AppColors.redColor
                                  : AppColors.greenColor,
                              shape: BoxShape.circle),
                        ),
                        Text(
                          validatedTasksForUser.status ?? '',
                          style: Get.theme.textTheme.labelMedium!.copyWith(
                              color: (validatedTasksForUser.status == 'pending')
                                  ? AppColors.redColor
                                  : AppColors.greenColor,
                              fontWeight: FontWeight.w600),
                        ).paddingOnly(left: Appdimens.dimen6),
                      ],
                    ),
                    Text(
                      validatedTasksForUser.task ?? '',
                      maxLines: 2,
                      style: Get.theme.textTheme.labelMedium!
                          .copyWith(color: AppColors.secondaryColor),
                    ).paddingOnly(top: Appdimens.dimen10),
                    if (validatedTasksForUser.note != null &&
                        validatedTasksForUser.note!.isNotEmpty)
                      Row(
                        children: [
                          Image.asset(
                            AppImages.pin,
                            height: Appdimens.dimen16,
                            color: AppColors.greyColor,
                          ),
                          Expanded(
                            child: Text(
                              validatedTasksForUser.note ?? '',
                              style: Get.theme.textTheme.labelMedium!.copyWith(
                                  color:
                                      AppColors.secondaryColor.withOpacity(0.5),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12),
                            ).paddingOnly(left: Appdimens.dimen10),
                          ),
                        ],
                      ).paddingSymmetric(vertical: Appdimens.dimen10),
                  ],
                ),
              ),
              if (validatedTasksForUser.status == 'pending')
                appButton(
                  AppStrings.markAsDone,
                  width: double.infinity,
                  style: Get.theme.textTheme.labelMedium!.copyWith(
                      color: AppColors.terneryColor,
                      fontWeight: FontWeight.w500),
                  height: Appdimens.dimen45,
                  onTap: () {},
                )
            ],
          ).paddingAll(Appdimens.dimen14),
        ),
      );

  Widget taskCountView() => Container(
        decoration: AppDecoration.cardDecoration(),
        padding: EdgeInsets.all(Appdimens.dimen10),
        child: Row(
          children: [
            Expanded(
                child: getView(AppColors.secondaryColor, AppStrings.tasks,
                    visitData.validatedTasksForUser!.length.toString())),
            SizedBox(
              width: AppConst.isMobile ? Appdimens.dimen10 : Appdimens.dimen30,
            ),
            Expanded(
                child: Container(
                    decoration: AppDecoration.cardDecoration(
                        color: AppColors.terneryColor),
                    padding: EdgeInsets.symmetric(vertical: Appdimens.dimen10),
                    child: getView(
                            AppColors.redColor,
                            AppStrings.pending,
                            visitData.validatedTasksForUser!
                                .where((element) => element.status == 'pending')
                                .toList()
                                .length
                                .toString())
                        .paddingSymmetric(
                            vertical:
                                AppConst.isMobile ? 0 : Appdimens.dimen20))),
            SizedBox(
              width: AppConst.isMobile ? Appdimens.dimen10 : Appdimens.dimen30,
            ),
            Expanded(
                child: Container(
                    decoration: AppDecoration.cardDecoration(
                        color: AppColors.terneryColor),
                    padding: EdgeInsets.symmetric(vertical: Appdimens.dimen10),
                    child: getView(
                            AppColors.greenColor,
                            AppStrings.completed,
                            visitData.validatedTasksForUser!
                                .where((element) => element.status != 'pending')
                                .toList()
                                .length
                                .toString())
                        .paddingSymmetric(
                            vertical:
                                AppConst.isMobile ? 0 : Appdimens.dimen20))),
          ],
        ),
      );

  Widget getView(Color? color, String title, String count) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            count,
            style: Get.theme.textTheme.headlineLarge!.copyWith(color: color),
          ).paddingSymmetric(vertical: Appdimens.dimen10),
          Text(
            title,
            style: Get.theme.textTheme.labelMedium!.copyWith(color: color),
          )
        ],
      );
}
