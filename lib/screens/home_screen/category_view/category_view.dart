import 'package:pocket_clinic/screens/home_screen/home_container.dart';
import 'package:pocket_clinic/utils/app_config.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return AppConst.isMobile
          ? Column(
              children: [
                getCategoryView(controller),
                Expanded(child: controller.catViewList[controller.selectedCat])
              ],
            )
          : Row(
              children: [
                getCategoryView(controller),
                Expanded(child: controller.catViewList[controller.selectedCat])
              ],
            );
    });
  }

  getCategoryView(HomeController controller) => Container(
        decoration: BoxDecoration(
            color: AppConst.isMobile
                ? AppColors.deviderColor
                : AppColors.primaryColor,
            borderRadius: AppConst.isMobile
                ? null
                : BorderRadius.only(
                    topRight: Radius.circular(
                      Appdimens.dimen20,
                    ),
                    bottomRight: Radius.circular(
                      Appdimens.dimen20,
                    ))),
        padding: AppConst.isMobile
            ? EdgeInsets.all(Appdimens.dimen20)
            : EdgeInsets.symmetric(vertical: Appdimens.dimen30),
        margin: AppConst.isMobile
            ? null
            : EdgeInsets.only(right: Appdimens.dimen30),
        height: AppConst.isMobile ? Appdimens.dimen150 : Appdimens.screenHeight,
        width: AppConst.isMobile ? null : Appdimens.dimen250,
        child: ListView.builder(
          scrollDirection: AppConst.isMobile ? Axis.horizontal : Axis.vertical,
          itemCount: controller.catList.length,
          itemBuilder: (context, index) => AppConst.isMobile
              ? getCatCardMobile(controller, index)
              : getCatCardDesktop(controller, index),
        ),
      );

  getCatCardMobile(HomeController controller, int index) => Container(
        margin: EdgeInsets.only(right: Appdimens.dimen10),
        width: Appdimens.dimen100,
        padding: EdgeInsets.all(Appdimens.dimen10),
        decoration: BoxDecoration(
            color: controller.selectedCat == index
                ? AppColors.primaryColor
                : AppColors.terneryColor,
            borderRadius: BorderRadius.circular(Appdimens.dimen20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              controller.catList[index]['img'],
              height: Appdimens.dimen50,
            ),
            FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  controller.catList[index]['title'],
                  style: Get.theme.textTheme.labelMedium!.copyWith(
                      color: controller.selectedCat == index
                          ? AppColors.terneryColor
                          : AppColors.secondaryColor,
                      fontWeight: FontWeight.w500),
                ).paddingOnly(top: Appdimens.dimen10))
          ],
        ),
      ).asButton(onTap: () => controller.changeCat(index));

  getCatCardDesktop(HomeController controller, int index) => Container(
        margin: EdgeInsets.only(left: Appdimens.dimen20),
        height: Appdimens.dimen80,
        padding: EdgeInsets.only(left: Appdimens.dimen20),
        decoration: BoxDecoration(
            color: controller.selectedCat == index
                ? AppColors.terneryColor
                : AppColors.primaryColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Appdimens.dimen20),
                bottomLeft: Radius.circular(Appdimens.dimen20))),
        child: Row(
          children: [
            Image.asset(
              controller.catList[index]['img'],
              height: Appdimens.dimen50,
            ),
            FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  controller.catList[index]['title'],
                  style: Get.theme.textTheme.labelMedium!.copyWith(
                      color: controller.selectedCat == index
                          ? AppColors.secondaryColor
                          : AppColors.terneryColor,
                      fontWeight: FontWeight.w500),
                ).paddingOnly(left: Appdimens.dimen10))
          ],
        ),
      ).asButton(onTap: () => controller.changeCat(index));
}
