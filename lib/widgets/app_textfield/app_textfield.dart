import 'package:pocket_clinic/utils/app_config.dart';
import 'package:pocket_clinic/widgets/app_textfield/textfield_controller.dart';

class AppTextField extends StatelessWidget {
  final String? hintText;
  final String? tag;
  final double? height;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final EdgeInsetsGeometry? contentPadding;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final int? maxLength;
  final Color? color;
  final Widget? prefixIcon;
  final Function()? onTap;
  final bool readOnly;
  final Decoration? decoration;

  const AppTextField({
    super.key,
    this.hintText,
    this.tag,
    this.height,
    this.controller,
    this.focusNode,
    this.contentPadding,
    this.keyboardType,
    this.obscureText = false,
    this.onChanged,
    this.validator,
    this.maxLength,
    this.color,
    this.prefixIcon,
    this.onTap,
    this.readOnly = false,
    this.decoration
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TextFieldController>(
      init: TextFieldController()..setData(obscureText),
      tag: tag ?? (hintText ?? 'field'),
      builder: (controller1) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            height: height,
            decoration:decoration?? AppDecoration.fieldDecoration(),
            margin: EdgeInsets.only(top: Appdimens.dimen6),
            child: Center(
              child: TextFormField(
                onTap: onTap,
                controller: controller,
                focusNode: focusNode,
                style: Get.theme.textTheme.titleSmall,
                cursorColor: Get.theme.primaryColor,
                obscuringCharacter: '*',
                obscureText: controller1.isObscureText,
                keyboardType: keyboardType ?? TextInputType.text,
                onChanged: onChanged,
                validator: (value) {
                  if (validator != null) {
                    controller1.validatorMsg = validator!.call(value!);
                    controller1.update();
                  }
                  return controller1.validatorMsg;
                },
                maxLength: maxLength,
                readOnly: readOnly,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                    hintText: hintText,
                    hintStyle: Get.theme.textTheme.labelMedium,
                    suffixIcon: obscureText
                        ? GestureDetector(
                            onTap: () {
                              controller1.isObscureText =
                                  !controller1.isObscureText;
                              controller1.update();
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Image.asset(
                                controller1.isObscureText
                                    ? AppImages.hideEye
                                    : AppImages.eye,
                                width: Appdimens.dimen4,
                                height: Appdimens.dimen4,
                              ),
                            ),
                          )
                        : null,
                    prefixIcon: prefixIcon,
                    contentPadding: contentPadding ??
                        EdgeInsets.symmetric(
                            horizontal: Appdimens.dimen20,
                            vertical: Appdimens.dimen20),
                    border: InputBorder.none,
                    errorText: '',
                    errorStyle: const TextStyle(
                        fontSize: 0, color: AppColors.primaryColor),
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none),
              ),
            ),
          ),
          if (controller1.validatorMsg != null)
            Text(
              controller1.validatorMsg ?? '',
              style: Get.theme.textTheme.labelMedium
                  ?.copyWith(color: AppColors.redColor),
            ).paddingOnly(top: Appdimens.dimen6, left: Appdimens.dimen14)
        ],
      ),
    );
  }
}
