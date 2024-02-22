import 'app_config.dart';

class AppTheme {
  static final light = ThemeData.light().copyWith(
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: AppColors.terneryColor,
      iconTheme: const IconThemeData(color: AppColors.secondaryColor),
      cardColor: AppColors.cardColor.withOpacity(0.09),
      hintColor: AppColors.hintColor,
      dividerColor: AppColors.deviderColor,
      textTheme: TextTheme(
          headlineLarge: getTextStyle(
              AppColors.secondaryColor, FontDimen.dimen28,
              fontWeight: FontWeight.w700),
          headlineMedium: getTextStyle(AppColors.secondaryColor, FontDimen.dimen20,
              fontWeight: FontWeight.w600),
          headlineSmall: getTextStyle(AppColors.terneryColor, FontDimen.dimen22,
              fontWeight: FontWeight.w700),
          bodyLarge: getTextStyle(AppColors.secondaryColor, FontDimen.dimen22,
              fontWeight: FontWeight.w600),
          bodyMedium: getTextStyle(AppColors.primaryColor, FontDimen.dimen18,
              fontWeight: FontWeight.w500),
          bodySmall: getTextStyle(AppColors.terneryColor, FontDimen.dimen18,
              fontWeight: FontWeight.w500),
          labelLarge: getTextStyle(AppColors.greyColor, FontDimen.dimen18,
              fontWeight: FontWeight.w400),
          labelMedium: getTextStyle(AppColors.hintColor, FontDimen.dimen14,
              fontWeight: FontWeight.w400),
          labelSmall: getTextStyle(AppColors.primaryColor, FontDimen.dimen16,
              fontWeight: FontWeight.w500),
          titleLarge: getTextStyle(AppColors.terneryColor, FontDimen.dimen16,
              fontWeight: FontWeight.w500),
          titleMedium: getTextStyle(AppColors.greyColor, FontDimen.dimen16,
              fontWeight: FontWeight.w400),
          titleSmall: getTextStyle(AppColors.secondaryColor, FontDimen.dimen16,
              fontWeight: FontWeight.w400)));
}

TextStyle getTextStyle(Color color, double size, {FontWeight? fontWeight}) =>
    TextStyle(
      color: color,
      fontSize: size,
      fontWeight: fontWeight,
      letterSpacing: 0.02,
      height: 1.2,
    );
