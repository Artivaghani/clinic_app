import 'app_config.dart';

class AppDecoration {
  static BoxDecoration notiCountDecoration() {
    return BoxDecoration(color: Get.theme.primaryColor, shape: BoxShape.circle);
  }

  static BoxDecoration cardDecoration(
      {Color? color, BoxBorder? border, BorderRadiusGeometry? borderRadius}) {
    return BoxDecoration(
        color: color ?? AppColors.deviderColor,
        border: border ??
            Border.all(color: AppColors.cardColor.withOpacity(0.09), width: 1),
        borderRadius: borderRadius ?? BorderRadius.circular(Appdimens.dimen20),
        boxShadow: [
          BoxShadow(
              offset: const Offset(
                0,
                4,
              ),
              blurRadius: 10,
              color: AppColors.cardColor.withOpacity(0.15)),
        ]);
  }

  static fieldDecoration({
    BorderRadiusGeometry? borderRadius,
  }) =>
      BoxDecoration(
          color: AppColors.terneryColor,
          borderRadius: borderRadius ?? BorderRadius.circular(10),
          border: Border.all(color: AppColors.deviderColor, width: 1),
          boxShadow: [
            BoxShadow(
                color: AppColors.cardColor.withOpacity(
                  0.10,
                ),
                offset: const Offset(0, 9),
                blurRadius: 10,
                spreadRadius: 0)
          ]);
}
