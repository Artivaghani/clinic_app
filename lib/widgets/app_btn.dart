import 'package:pocket_clinic/utils/app_config.dart';

Widget appButton(String title,
    {Color? color,
    double? width,
    TextStyle? style,
    double? height,
    Function()? onTap,
    BorderRadiusGeometry? borderRadius}) {
  return SizedBox(
    width: width,
    height: height ?? Appdimens.dimen65,
    child: ElevatedButton(
      onPressed: onTap,
      style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(AppColors.primaryColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(10),
          ))),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          title,
          maxLines: 1,
          textAlign: TextAlign.center,
          style: style ?? Get.theme.textTheme.headlineSmall,
        ),
      ),
    ),
  );
}
