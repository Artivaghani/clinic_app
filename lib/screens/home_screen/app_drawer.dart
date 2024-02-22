import 'package:pocket_clinic/utils/app_config.dart';

appDrwawer() => Drawer(
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          const Icon(
            Icons.close,
          )
              .paddingOnly(top: Appdimens.dimen50)
              .align(alignment: Alignment.topLeft)
              .asButton(onTap: () => Get.back()),
          getRow(AppStrings.logOut).paddingOnly(top: Appdimens.dimen50)
        ],
      ).paddingAll(Appdimens.dimen20),
    );

Widget getRow(String title) => Container(
      height: Appdimens.dimen60,
      decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(0.1),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      padding:  EdgeInsets.symmetric(horizontal: Appdimens.dimen20),
      child: Center(
        child: Row(
          children: [
            const Icon(
              Icons.logout,
              color: AppColors.primaryColor,
            ),
            Text(
              title,
              style: Get.theme.textTheme.labelSmall,
            ).paddingOnly(left: Appdimens.dimen10)
          ],
        ),
      ),
    );
