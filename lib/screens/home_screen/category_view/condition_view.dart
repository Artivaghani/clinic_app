import 'package:pocket_clinic/utils/app_config.dart';

class ConditionView extends StatelessWidget {
  const ConditionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextField(
          hintText: AppStrings.searchConditions,
          validator: AppValidation.checkEmpty,
          prefixIcon: const Icon(Icons.search_rounded),
        ),
        Row(
          children: [
            Text(
              '0 known Conditions',
              style: Get.theme.textTheme.titleSmall!
                  .copyWith(fontWeight: FontWeight.w500),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: Appdimens.dimen16,
            ).paddingOnly(left: Appdimens.dimen10)
          ],
        ).paddingOnly(top: Appdimens.dimen30),
        Expanded(
            child: AppConst.isMobile
                ? ListView.builder(
                    itemCount: 2,
                    itemBuilder: (context, index) => catCard(),
                  ).paddingOnly(top: Appdimens.dimen20)
                : GridView.builder(
                   
                    itemCount: 4,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 1.9,
                        crossAxisSpacing: Appdimens.dimen20,
                        mainAxisSpacing: Appdimens.dimen20,
                        crossAxisCount: 2),
                    itemBuilder: (context, index) => catCard(),
                  ).paddingOnly(top: Appdimens.dimen20))
      ],
    ).paddingSymmetric(horizontal: Appdimens.dimen20,vertical: Appdimens.dimen20);
  }

  catCard() => Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: AppColors.greenColor,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 3,
        child: Container(
          color: AppColors.terneryColor,
          margin: EdgeInsets.only(left: Appdimens.dimen20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: Appdimens.dimen16,
                        width: Appdimens.dimen16,
                        decoration: const BoxDecoration(
                            color: AppColors.greenColor,
                            shape: BoxShape.circle),
                      ),
                      Text(
                        'Active',
                        style: Get.theme.textTheme.labelMedium!.copyWith(
                            color: AppColors.greenColor,
                            fontWeight: FontWeight.w600),
                      ).paddingOnly(left: Appdimens.dimen6),
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset(
                        AppImages.clock,
                        height: Appdimens.dimen20,
                        color: AppColors.greyColor,
                      ),
                      Text(
                        'Jan 31, 2024',
                        style: Get.theme.textTheme.labelMedium!.copyWith(
                            color: AppColors.greyColor,
                            fontWeight: FontWeight.w500),
                      ).paddingOnly(left: Appdimens.dimen6),
                    ],
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    AppImages.heart,
                    height: Appdimens.dimen30,
                  ),
                  Expanded(
                      child: Text(
                    'Schedule a follow-up appointment for a COVID-19 vaccine booster shot at Walgreen Co.',
                    maxLines: 2,
                    style: Get.theme.textTheme.labelMedium!
                        .copyWith(color: AppColors.secondaryColor),
                  ).paddingOnly(left: Appdimens.dimen10)),
                ],
              ).paddingOnly(top: Appdimens.dimen20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Condition period -',
                    style: Get.theme.textTheme.labelMedium!.copyWith(
                        color: AppColors.secondaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: FontDimen.dimen12),
                  ),
                  Expanded(
                      child: Text(
                    '6 months (Jan 31, 2024 - Jan 31, 2024)',
                    maxLines: 2,
                    style: Get.theme.textTheme.labelMedium!.copyWith(
                        color: AppColors.greyColor,
                        fontSize: FontDimen.dimen10),
                  ).paddingOnly(left: Appdimens.dimen10)),
                ],
              ).paddingOnly(top: Appdimens.dimen20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Verification status -',
                    style: Get.theme.textTheme.labelMedium!.copyWith(
                        color: AppColors.secondaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: FontDimen.dimen12),
                  ),
                  Expanded(
                      child: Text(
                    'Confirmed',
                    maxLines: 2,
                    style: Get.theme.textTheme.labelMedium!.copyWith(
                      color: AppColors.greenColor,
                    ),
                  ).paddingOnly(left: Appdimens.dimen10)),
                ],
              ).paddingOnly(top: Appdimens.dimen10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    AppImages.hostpital,
                    height: Appdimens.dimen20,
                  ),
                  Expanded(
                    child: Text(
                      'Kaiser NC - Moscone Center COVID-19 Vaccination Hub',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Get.theme.textTheme.labelMedium!.copyWith(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w500),
                    ).paddingOnly(left: Appdimens.dimen6),
                  ),
                ],
              ).paddingOnly(top: Appdimens.dimen14),
              appButton(
                AppStrings.markAsDone,
                width: double.infinity,
                style: Get.theme.textTheme.labelMedium!.copyWith(
                    color: AppColors.terneryColor, fontWeight: FontWeight.w500),
                height:
                    AppConst.isMobile ? Appdimens.dimen50 : Appdimens.dimen50,
                onTap: () {},
              ).paddingOnly(top: Appdimens.dimen20)
            ],
          ).paddingAll(
              AppConst.isMobile ? Appdimens.dimen14 : Appdimens.dimen20),
        ),
      ).paddingOnly(right: Appdimens.dimen10);
}
