import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pen/Bloc/Cubit/app_cubit.dart';
import 'package:pen/Bloc/Cubit/app_states.dart';
import 'package:pen/Config/router.dart';
import 'package:pen/Widgets/empty_widget.dart';
import 'package:pen/Widgets/lesson_widget.dart';

import '../../Config/ad_mob_services.dart';
import '../../Config/cache_helper.dart';
import '../../Theme/app_colors.dart';
import '../../Theme/text_style.dart';
import '../UpdateRuleScreen/update_rule_screen.dart';

class RulesScreen extends StatelessWidget {
  const RulesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Rules'.tr(),
              style: textStyle(
                cubit,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
            backgroundColor: AppColors.white,
            elevation: 0,
          ),
          body: cubit.listOfRules.isEmpty
              ? Center(child: emptyWidget('No Rules yet'.tr(), cubit))
              : Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 8.h,
                      ),
                      CacheHelper.userType != 'Active'
                          ? AdMobServices.showBannerAds(cubit.rulesBanner!)
                          : const SizedBox(),
                      Container(
                        height: 43.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: AppColors.gray1,
                            width: 2.0,
                          ),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            hint: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                cubit.isTypeChanged
                                    ? cubit.currentType!
                                    : "All",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: textStyle(
                                  cubit,
                                  fontWeight: FontWeight.w500,
                                  color: cubit.isCountryChanged
                                      ? AppColors.defaultAppColor
                                      : Colors.black54,
                                ),
                              ),
                            ),
                            icon: const Padding(
                              padding: EdgeInsets.all(2.0),
                              child: Icon(
                                Icons.arrow_drop_down,
                              ),
                            ),
                            iconSize: 22,
                            dropdownColor: Colors.white,
                            items: cubit.buildDropdownTypesItemsFrom(cubit),
                            itemHeight: 50,
                            onChanged: (value) async {
                              if (CacheHelper.userType != 'Active') {
                                AdMobServices.createInterstitialAd(
                                    cubit.interstitialAd);
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.info,
                                  animType: AnimType.rightSlide,
                                  title: 'To Premium'.tr(),
                                  desc:
                                      "Once upgraded, you gain the ability to open all videos"
                                          .tr(),
                                  dialogBackgroundColor: AppColors.white,
                                  titleTextStyle: textStyle(
                                    cubit,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  descTextStyle: textStyle(cubit),
                                  btnCancelText: 'Cancel'.tr(),
                                  btnCancelColor: AppColors.thirdAppColor,
                                  btnCancelOnPress: () {},
                                ).show();
                              } else {
                                await cubit.onChangeDropdownTypeItemFrom(value);
                              }
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Expanded(
                        child: ListView.builder(
                          physics: const AlwaysScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: cubit.listOfRules.length,
                          itemBuilder: (BuildContext context, index) {
                            return lessonWidget(
                              /*    onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => UpdateRuleScreen(
                                      rulesModel: cubit.listOfRules[index],
                                    ),
                                  ),
                                );
                              },*/
                              title: cubit.listOfRules[index].title,
                              cubit: cubit,
                              icon: CupertinoIcons.play_circle,
                              onPressed: () {
                                if (CacheHelper.userType != 'Active' &&
                                    index > 0) {
                                  AdMobServices.createInterstitialAd(
                                      cubit.interstitialAd);
                                  AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.info,
                                    animType: AnimType.rightSlide,
                                    title: 'To Premium'.tr(),
                                    desc:
                                        "Once upgraded, you gain the ability to open all videos"
                                            .tr(),
                                    dialogBackgroundColor: AppColors.white,
                                    titleTextStyle: textStyle(
                                      cubit,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    descTextStyle: textStyle(cubit),
                                    btnCancelText: 'Cancel'.tr(),
                                    btnCancelColor: AppColors.thirdAppColor,
                                    btnCancelOnPress: () {},
                                  ).show();
                                } else if (CacheHelper.userType != 'Active' &&
                                    index == 0) {
                                  AdMobServices.createInterstitialAd(
                                      cubit.interstitialAd);
                                  cubit.videoLink =
                                      cubit.listOfRules[index].videoUrl;
                                  Navigator.pushNamed(
                                      context, Routes.videoScreen);
                                } else {
                                  cubit.videoLink =
                                      cubit.listOfRules[index].videoUrl;
                                  Navigator.pushNamed(
                                      context, Routes.videoScreen);
                                }
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
