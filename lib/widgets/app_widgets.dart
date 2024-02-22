import 'package:pocket_clinic/utils/app_config.dart';

class AppWidgets {
  static AppBar titleBar(
          {bool isBack = true, List<Widget>? actions, Function()? onTap}) =>
      AppBar(
        leadingWidth: AppConst.isMobile? Appdimens.dimen35:null, 
        automaticallyImplyLeading: isBack,
        scrolledUnderElevation: 0.0,
        titleTextStyle: Get.theme.textTheme.displaySmall,
        title: Image.asset(
          AppImages.logo,
          height: Appdimens.dimen40,
        ),
        centerTitle: false,
        iconTheme: const IconThemeData(color: AppColors.primaryColor),
        backgroundColor: AppColors.terneryColor,
        elevation: 0,
        shape: const Border(bottom: BorderSide(color: AppColors.deviderColor)),
        actions: actions,
      );

  static Widget processIntegrator({Color? color}) => Center(
          child: SpinKitDoubleBounce(
        size: Appdimens.dimen50,
        color: color ?? Get.theme.primaryColor,
      ));

  static Widget datanotfoundtext({String? title,String? subTitle}) {
    return Container(
      width: Appdimens.screenWidth,
      decoration: const BoxDecoration(color: Colors.transparent),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
          title?? 'Sorry!!!',
            style: Get.theme.textTheme.bodyLarge!
                .copyWith(color: AppColors.greyColor),
          ),
          Text(
            subTitle ?? "Results not found",
            textAlign: TextAlign.center,
            style: Get.theme.textTheme.bodyMedium!
                .copyWith(color: AppColors.greyColor),
          ).paddingOnly(top: Appdimens.dimen20),
        ],
      ),
    );
  }

  static roundShapBtn({double? size, Widget? child}) {
    return Container(
      decoration: BoxDecoration(
        color: Get.theme.primaryColor.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      width: size ?? Appdimens.dimen60,
      height: size ?? Appdimens.dimen60,
      child: Center(
        child: child ??
            Icon(
              Icons.arrow_back_ios_rounded,
              size: Appdimens.dimen20,
            ),
      ),
    );
  }

  static roundNetworkImg(String url, {double? radius}) {
    return CircleAvatar(
      radius: radius ?? 26,
      backgroundImage: NetworkImage(url),
    );
  }

  static roundAssetImg(String path, {double? radius}) {
    return CircleAvatar(
      radius: radius ?? 26,
      backgroundImage: AssetImage(path),
    );
  }
}
