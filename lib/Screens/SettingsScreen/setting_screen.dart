import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pen/Bloc/Cubit/app_states.dart';
import 'package:pen/Screens/SettingsScreen/widgets/settings_list_tile_widgets.dart';
import 'package:pen/Theme/app_colors.dart';
import 'package:pen/Theme/text_style.dart';
import 'package:pen/Widgets/custom_row_item.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:share_plus/share_plus.dart';

import '../../Bloc/Cubit/app_cubit.dart';
import '../../Config/ad_mob_services.dart';
import '../../Config/cache_helper.dart';
import '../../Config/common_components.dart';
import '../../Config/router.dart';
import '../../Widgets/button_global.dart';
import '../PremiumInfoScreen/premium_info_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Settings'.tr(),
              style: textStyle(
                cubit,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
            backgroundColor: AppColors.white,
            elevation: 0,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                    child: Text(
                      'My Account'.tr().toUpperCase(),
                      style: textStyle(cubit, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Card(
                    child: Column(
                      children: [
                        SettingsListTile(
                          cubit: cubit,
                          press: () async {
                            cubit.loadProfileBanner();
                            Navigator.pushNamed(context, Routes.profileScreen);
                          },
                          title: 'Profile'.tr(),
                          leadingIcon: CupertinoIcons.person,
                        ),
                        const Divider(
                          height: 0,
                          indent: 0,
                          thickness: 1,
                          color: AppColors.gray1,
                        ),
                        CacheHelper.userType != 'Active'
                            ? SettingsListTile(
                                cubit: cubit,
                                title: 'To Premium'.tr(),
                                leadingIcon: CupertinoIcons.staroflife,
                                press: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const PremiumInfoScreen()));
                                },
                              )
                            : const SizedBox(),
                        CacheHelper.userType != 'Active'
                            ? const Divider(
                                height: 0,
                                indent: 0,
                                thickness: 1,
                                color: AppColors.gray1,
                              )
                            : const SizedBox(),
                        InkWell(
                          splashColor: AppColors.black.withOpacity(0.0),
                          highlightColor: AppColors.black.withOpacity(0.0),
                          onTap: () => cubit.changeLanguageContainerStatus(),
                          child: BuildRowItem(
                            cubit: cubit,
                            iconData: Icons.language,
                            text: 'language'.tr(),
                            arrowStatus: cubit.isLanguageContainerOpen,
                          ),
                        ),
                        if (cubit.isLanguageContainerOpen) ...[
                          myDivider(),
                          buildLanguageColumn(cubit, state, context),
                        ],
                        const Divider(
                          height: 0,
                          indent: 0,
                          thickness: 1,
                          color: AppColors.gray1,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                    child: Text(
                      'Reach out to us'.tr().toUpperCase(),
                      style: textStyle(cubit, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Card(
                    child: Column(
                      children: [
                        SettingsListTile(
                          cubit: cubit,
                          title: 'Share App'.tr(),
                          leadingIcon: Icons.share_outlined,
                          press: () {
                            Share.share(
                                "If you love the app please review the app on playst ore and share it with your friends. https://play.google.com/store/apps/details?id=com.turkey.tutorial");
                          },
                        ),
                        const Divider(
                          height: 0,
                          indent: 0,
                          thickness: 1,
                          color: AppColors.gray1,
                        ),
                        SettingsListTile(
                          cubit: cubit,
                          title: 'Rate App'.tr(),
                          leadingIcon: CupertinoIcons.star,
                          press: () async {
                            /*         LaunchReview.launch(
                                  androidAppId: "com.work.plus",
                                  iOSAppId: "1568670214");*/

                            final InAppReview inAppReview =
                                InAppReview.instance;

                            if (await inAppReview.isAvailable()) {
                              inAppReview.requestReview();
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                    child: Text(
                      'Know More'.tr().toUpperCase(),
                      style: textStyle(cubit, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Card(
                    child: Column(
                      children: [
                        SettingsListTile(
                            cubit: cubit,
                            title: 'FAQs'.tr(),
                            leadingIcon: Icons.question_answer_outlined,
                            press: () {
                              Navigator.pushNamed(context, Routes.faqsScreen);
                            }),
                        const Divider(
                          height: 0,
                          indent: 0,
                          thickness: 1,
                          color: AppColors.gray1,
                        ),
                        SettingsListTile(
                          cubit: cubit,
                          title: 'Privacy Policy'.tr(),
                          leadingIcon: Icons.question_mark_outlined,
                          press: () {
                            Navigator.pushNamed(context, Routes.privacyScreen);
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  ButtonGlobal(
                    padding: 0,
                    onPressed: () {
                      CacheHelper.clear();
                      Navigator.pushNamedAndRemoveUntil(
                          context, Routes.loginScreen, (route) => false);
                    },
                    buttontext: "Sign Out".tr(),
                    buttonDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: AppColors.amber500),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(FontAwesomeIcons.facebook),
                          color: AppColors.thirdAppColor,
                          iconSize: 25,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(FontAwesomeIcons.telegram),
                          color: AppColors.thirdAppColor,
                          iconSize: 25,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(FontAwesomeIcons.youtube),
                          color: AppColors.thirdAppColor,
                          iconSize: 25,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: CacheHelper.userType != 'Active'
              ? AdMobServices.showBannerAds(cubit.settingsBanner!)
              : const SizedBox(),
        );
      },
    );
  }
}
