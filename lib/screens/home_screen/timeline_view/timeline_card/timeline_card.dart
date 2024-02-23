import 'package:pocket_clinic/screens/home_screen/timeline_view/timeline_card/timeline_controller.dart';
import 'package:pocket_clinic/utils/app_config.dart';
import 'package:pocket_clinic/widgets/app_btn.dart';

class TimeLineCard extends StatelessWidget {
  final int index;
  const TimeLineCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: TimelineController(),
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

  leftView(TimelineController controller) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Outpatient',
            style: Get.theme.textTheme.bodyLarge!,
          ).paddingOnly(bottom: Appdimens.dimen10),
          Row(
            children: [
              Image.asset(
                AppImages.clock,
                height: Appdimens.dimen20,
              ),
              Text(
                'Jan 31, 2024',
                style: Get.theme.textTheme.labelMedium!.copyWith(
                    color: AppColors.primaryColor, fontWeight: FontWeight.w500),
              ).paddingOnly(left: Appdimens.dimen6),
            ],
          ).paddingSymmetric(vertical: Appdimens.dimen10),
          Row(
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
          if (controller.isExpand)
            Text(
              'Visit Summary',
              style: Get.theme.textTheme.headlineMedium!,
            ).paddingOnly(top: Appdimens.dimen30, bottom: Appdimens.dimen10),
          Text(
            'You recently had an outpatient encounter with Alexandra Hobson and underwent a brain MRI for your menstrual migraine headache. The results showed a normal brain, and the report was signed by Javier Villanueva-Meyer, MD.',
            maxLines: 2,
            style: Get.theme.textTheme.labelMedium!
                .copyWith(color: AppColors.secondaryColor),
          ).paddingOnly(top: Appdimens.dimen10),
          if (controller.isExpand)
            Text(
              'Diagnosis and Condition Overview',
              style: Get.theme.textTheme.labelSmall!,
            ).paddingOnly(top: Appdimens.dimen20, bottom: Appdimens.dimen10),
          if (controller.isExpand)
            Text(
              'You recently had an outpatient encounter with Alexandra Hobson and underwent a brain MRI for your menstrual migraine headache. The results showed a normal brain, and the report was signed by Javier Villanueva-Meyer, MD.',
              maxLines: 2,
              style: Get.theme.textTheme.labelMedium!
                  .copyWith(color: AppColors.secondaryColor),
            ),
          if (controller.isExpand)
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.primaryColor, width: 2),
                  borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.symmetric(
                  vertical: Appdimens.dimen8, horizontal: Appdimens.dimen20),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    AppImages.file,
                    height: Appdimens.dimen30,
                  ),
                  Text(
                    'Dr. Martha’s Notes',
                    style: Get.theme.textTheme.labelSmall!,
                  ).paddingOnly(left: Appdimens.dimen6)
                ],
              ),
            ).paddingOnly(top: Appdimens.dimen20),
        ],
      );

  sideView() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                  itemCount: 3,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => taskCard(),
                ).paddingOnly(top: Appdimens.dimen10)
              : GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 4,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio:
                          Appdimens.screenHeight < 800 ? 0.78 : 0.9,
                      crossAxisSpacing: Appdimens.dimen20,
                      mainAxisSpacing: Appdimens.dimen20,
                      crossAxisCount: 3),
                  itemBuilder: (context, index) => taskGridCard(),
                ).paddingOnly(top: Appdimens.dimen10),
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
          Text(
            'Complete the Egg Cryo labs as per the doctor\'s recommendation \nAttend appointments for EggCryo modules as schedule Follow the prescribed protocol for E2P 2/2 Inform MN about AFC at Baseline, CD3 E2, and the option for HCG + Lupron',
            maxLines: 2,
            style: Get.theme.textTheme.labelMedium!
                .copyWith(color: AppColors.secondaryColor),
          ).paddingOnly(top: Appdimens.dimen10),
        ],
      );

  taskCard() => Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: AppColors.redColor,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 4,
        child: Container(
          color: AppColors.terneryColor,
          margin: EdgeInsets.only(left: Appdimens.dimen20),
          child: Column(
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
                        color: AppColors.redColor, fontWeight: FontWeight.w600),
                  ).paddingOnly(left: Appdimens.dimen6),
                ],
              ),
              Text(
                'Schedule a follow-up appointment for a COVID-19 vaccine booster shot at Walgreen Co.',
                maxLines: 2,
                style: Get.theme.textTheme.labelMedium!
                    .copyWith(color: AppColors.secondaryColor),
              ).paddingOnly(top: Appdimens.dimen10),
              Row(
                children: [
                  Image.asset(
                    AppImages.pin,
                    height: Appdimens.dimen20,
                    color: AppColors.greyColor,
                  ),
                  Expanded(
                    child: Text(
                      'Inform MN about AFC at Baseline, CD3 E2, HCG + Lupron Option',
                      style: Get.theme.textTheme.labelMedium!.copyWith(
                          color: AppColors.secondaryColor.withOpacity(0.5),
                          fontWeight: FontWeight.w400,
                          fontSize: 12),
                    ).paddingOnly(left: Appdimens.dimen10),
                  ),
                ],
              ).paddingSymmetric(vertical: Appdimens.dimen10),
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
            ],
          ).paddingOnly(top: Appdimens.dimen14, left: Appdimens.dimen14),
        ),
      );

  taskGridCard() => Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: AppColors.redColor,
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
                              color: AppColors.redColor,
                              shape: BoxShape.circle),
                        ),
                        Text(
                          'Pending',
                          style: Get.theme.textTheme.labelMedium!.copyWith(
                              color: AppColors.redColor,
                              fontWeight: FontWeight.w600),
                        ).paddingOnly(left: Appdimens.dimen6),
                      ],
                    ),
                    Text(
                      'Schedule a follow-up appointment for a COVID-19 vaccine booster shot at Walgreen Co.',
                      maxLines: 2,
                      style: Get.theme.textTheme.labelMedium!
                          .copyWith(color: AppColors.secondaryColor),
                    ).paddingOnly(top: Appdimens.dimen10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          AppImages.pin,
                          height: AppConst.isMobile
                              ? Appdimens.dimen20
                              : Appdimens.dimen16,
                          color: AppColors.secondaryColor.withOpacity(0.4),
                        ),
                        Expanded(
                          child: Text(
                            'Inform MN about AFC at Baseline, CD3 E2, HCG + Lupron Option',
                            maxLines: 3,
                            style: Get.theme.textTheme.labelMedium!.copyWith(
                                color:
                                    AppColors.secondaryColor.withOpacity(0.4),
                                fontWeight: FontWeight.w400,
                                fontSize: 12),
                          ).paddingOnly(left: Appdimens.dimen10),
                        ),
                      ],
                    ).paddingSymmetric(vertical: Appdimens.dimen10),
                  ],
                ),
              ),
              appButton(
                AppStrings.markAsDone,
                width: double.infinity,
                style: Get.theme.textTheme.labelMedium!.copyWith(
                    color: AppColors.terneryColor, fontWeight: FontWeight.w500),
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
                child:
                    getView(AppColors.secondaryColor, AppStrings.tasks, '1')),
            SizedBox(
              width: AppConst.isMobile ? Appdimens.dimen10 : Appdimens.dimen30,
            ),
            Expanded(
                child: Container(
                    decoration: AppDecoration.cardDecoration(
                        color: AppColors.terneryColor),
                    padding: EdgeInsets.symmetric(vertical: Appdimens.dimen10),
                    child: getView(AppColors.redColor, AppStrings.pending, '1')
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
                    child:
                        getView(AppColors.greenColor, AppStrings.completed, '1')
                            .paddingSymmetric(
                                vertical: AppConst.isMobile
                                    ? 0
                                    : Appdimens.dimen20))),
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
