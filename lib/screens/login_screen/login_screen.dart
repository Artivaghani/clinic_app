import 'package:pocket_clinic/screens/login_screen/login_controller.dart';
import 'package:pocket_clinic/utils/app_config.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          AppConst.isMobile ? AppColors.terneryColor : AppColors.primaryColor,
      body: AppConst.isMobile
          ? getLoginView()
          : Row(
              children: [
                Expanded(flex: 3, child: imageView()),
                Expanded(flex: 2, child: getLoginView())
              ],
            ),
    );
  }

  getLoginView() => Container(
        padding: EdgeInsets.all(Appdimens.dimen30),
        decoration: const BoxDecoration(
            color: AppColors.terneryColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(
                  20,
                ),
                bottomLeft: Radius.circular(20))),
        child: Form(
          key: loginController.formKey,
          child: ListView(
            physics: const ClampingScrollPhysics(),
            children: [
              Image.asset(
                AppImages.logo,
                height: Appdimens.dimen50,
              ).align(alignment: Alignment.topRight),
              Text(
                AppStrings.login,
                style: Get.theme.textTheme.headlineLarge!,
              ).paddingOnly(top: Appdimens.dimen20, bottom: Appdimens.dimen60),
              AppTextField(
                controller: loginController.email,
                hintText: AppStrings.emailHint,
                validator: AppValidation.validatesEmail,
              ).paddingSymmetric(vertical: Appdimens.dimen10),
              AppTextField(
                controller: loginController.password,
                hintText: AppStrings.passwordHint,
                validator: AppValidation.validatesPassword,
                obscureText: true,
              ).paddingSymmetric(vertical: Appdimens.dimen10),
              Text(
                AppStrings.forgotPassword,
                style: Get.theme.textTheme.labelMedium!.copyWith(
                    color: AppColors.purpleColor,
                    decoration: TextDecoration.underline),
              )
                  .align(alignment: Alignment.topRight)
                  .paddingOnly(top: Appdimens.dimen6),
              Row(
                children: [
                  Text(
                    '${AppStrings.donHaveAccount} ',
                    style: Get.theme.textTheme.titleMedium,
                  ),
                  Text(
                    AppStrings.signUp,
                    style: Get.theme.textTheme.titleMedium!.copyWith(
                        color: AppColors.purpleColor,
                        decoration: TextDecoration.underline),
                  ),
                ],
              ).paddingOnly(top: Appdimens.dimen250),
              appButton(
                AppStrings.login,
                height: AppConst.isMobile ? null : Appdimens.dimen70,
                onTap: () => loginController.login(),
              ).paddingOnly(top: Appdimens.dimen50)
            ],
          ),
        ),
      );

  imageView() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              AppStrings.welcome,
              style: Get.theme.textTheme.headlineLarge!
                  .copyWith(color: AppColors.terneryColor),
            ),
            Text(AppStrings.helpUsMsg, style: Get.theme.textTheme.bodySmall)
          ]).paddingAll(Appdimens.dimen100),
          Expanded(
              child: Image.asset(
            AppImages.loginPage,
          ).align(alignment: Alignment.bottomLeft))
        ],
      );
}
