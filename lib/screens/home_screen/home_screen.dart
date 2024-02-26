import 'package:pocket_clinic/screens/help_screen/help_screen.dart';
import 'package:pocket_clinic/screens/home_screen/app_drawer.dart';
import 'package:pocket_clinic/screens/home_screen/category_view/category_view.dart';
import 'package:pocket_clinic/screens/home_screen/home_container.dart';
import 'package:pocket_clinic/screens/home_screen/timeline_view/timeline_view.dart';
import 'package:pocket_clinic/screens/notification_screen/notification_screen.dart';
import 'package:pocket_clinic/screens/profile_screen/profile_screen.dart';
import 'package:pocket_clinic/utils/app_config.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Appdimens.setSize(
        MediaQuery.of(context).size.height, MediaQuery.of(context).size.width);
    return GetBuilder(
        init: HomeController(),
        builder: (controller) {
          return Scaffold(
              drawer: appDrwawer(),
              appBar: AppWidgets.titleBar(actions: [
                const Icon(
                  Icons.notifications_none_rounded,
                  color: AppColors.primaryColor,
                )
                    .paddingOnly(right: Appdimens.dimen10)
                    .asButton(onTap: () => Get.to(const NotificationScreen())),
                if (!AppConst.isMobile)
                  const Icon(
                    Icons.help_outline_outlined,
                    color: AppColors.primaryColor,
                  )
                      .paddingOnly(right: Appdimens.dimen10)
                      .asButton(onTap: () => Get.to(const HelpScreen())),
                Container(
                  decoration: BoxDecoration(
                      color: AppColors.primaryColor.withOpacity(0.2),
                      shape: BoxShape.circle),
                  padding: const EdgeInsets.all(8),
                  margin: EdgeInsets.only(right: Appdimens.dimen10),
                  child: Text(
                    'AV',
                    style: Get.theme.textTheme.bodyLarge!
                        .copyWith(fontSize: FontDimen.dimen14),
                  ),
                ).asButton(onTap: () => Get.to(const ProfileScreen())),
              ]),
              body: Row(
                children: [
                  if (!AppConst.isMobile)
                    Container(
                      height: Appdimens.screenHeight,
                      decoration: BoxDecoration(
                          color: AppColors.terneryColor,
                          boxShadow: [
                            BoxShadow(
                                offset: const Offset(6, 0),
                                color: AppColors.cardColor.withOpacity(0.15),
                                blurRadius: 15,
                                spreadRadius: 0)
                          ]),
                      padding: EdgeInsets.all(Appdimens.dimen20),
                      child: Column(
                        children: [
                          getTimeLineView(controller).asButton(
                              onTap: () => controller.changeTab(true)),
                          getCategoryView(controller)
                              .paddingOnly(top: Appdimens.dimen30)
                              .asButton(
                                  onTap: () => controller.changeTab(false))
                        ],
                      ),
                    ),
                  Expanded(
                      child: controller.isTimeline
                          ? TimeLineview()
                          : const CategoryView())
                ],
              ),
              bottomNavigationBar:
                  AppConst.isMobile ? getNavigationBar(controller) : null);
        });
  }

  Widget getTimeLineView(HomeController controller) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppImages.timeline,
            height: Appdimens.dimen30,
            color: controller.isTimeline ? null : AppColors.secondaryColor,
          ),
          Text(
            AppStrings.timeline,
            style: Get.theme.textTheme.labelMedium!.copyWith(
                color: controller.isTimeline
                    ? AppColors.primaryColor
                    : AppColors.secondaryColor,
                fontWeight: FontWeight.w600),
          ).paddingOnly(
              top: AppConst.isMobile ? Appdimens.dimen4 : Appdimens.dimen8)
        ],
      );

  Widget getCategoryView(HomeController controller) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppImages.category,
            height: Appdimens.dimen30,
            color: controller.isTimeline ? AppColors.secondaryColor : null,
          ),
          Text(
            AppStrings.categories,
            style: Get.theme.textTheme.labelMedium!.copyWith(
                color: controller.isTimeline
                    ? AppColors.secondaryColor
                    : AppColors.primaryColor,
                fontWeight: FontWeight.w600),
          ).paddingOnly(
              top: AppConst.isMobile ? Appdimens.dimen4 : Appdimens.dimen8)
        ],
      );

  getNavigationBar(HomeController controller) => Container(
        decoration: BoxDecoration(color: AppColors.terneryColor, boxShadow: [
          BoxShadow(
              offset: const Offset(0.03, 0),
              blurRadius: 24,
              spreadRadius: 0,
              color: AppColors.cardColor.withOpacity(0.15))
        ]),
        height: Appdimens.dimen100,
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: controller.isTimeline
                    ? BoxDecoration(
                        color: AppColors.primaryColor.withOpacity(0.1),
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10)))
                    : null,
                child: Center(
                  child: getTimeLineView(controller),
                ),
              ).asButton(onTap: () => controller.changeTab(true)),
            ),
            Expanded(
              child: Container(
                decoration: controller.isTimeline
                    ? null
                    : BoxDecoration(
                        color: AppColors.primaryColor.withOpacity(0.1),
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10))),
                child: Center(
                  child: getCategoryView(controller),
                ),
              ).asButton(onTap: () => controller.changeTab(false)),
            )
          ],
        ),
      );
}
