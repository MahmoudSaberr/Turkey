import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pen/Config/cache_helper.dart';
import 'package:pen/Config/images.dart';
import 'package:pen/Theme/text_style.dart';
import 'package:pen/Widgets/button_global.dart';

import '../../Bloc/Cubit/app_cubit.dart';
import '../../Bloc/Cubit/app_states.dart';
import '../../Config/ad_mob_services.dart';
import '../../Config/router.dart';
import '../../Theme/app_colors.dart';
import '../LessonsScreen/lessons_screen.dart';
import '../LevelsScreen/widgets/level_widget.dart';

class BottomNavigationScreen extends StatelessWidget {
  const BottomNavigationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);

        return Scaffold(
          extendBody: true,
          appBar: AppBar(
            title: Image.asset(
              Images.appIcon,
              width: 60.w,
            ),
            leading: IconButton(
              icon: const Icon(
                CupertinoIcons.settings,
                color: AppColors.defaultAppColor,
              ),
              onPressed: () {
                cubit.loadSettingsBanner();
                Navigator.pushNamed(context, Routes.settingsScreen);
              },
            ),
            backgroundColor: AppColors.white,
            centerTitle: true,
            elevation: 0,
            /*actions: [
              IconButton(
                icon: const Icon(
                  CupertinoIcons.money_dollar_circle,
                  color: AppColors.defaultAppColor,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, Routes.paymentsScreen);
                },
              )
            ],*/
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                CacheHelper.userType != 'Active'
                    ? AdMobServices.showBannerAds(cubit.bannerAd!)
                    : SizedBox(
                        height: 60.h,
                      ),
                levelWidget(
                  onTap: () async {
                    if (CacheHelper.userType != 'Active') {
                      cubit.loadRulesBanner();
                    }
                    Navigator.pushNamed(context, Routes.rulesScreen);
                  },
                  title: 'Rules',
                  cubit: cubit,
                  gradientColor: AppColors.greenLevel,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7.0),
                        color: AppColors.liteSecondaryAppColor),
                    child: Column(
                      children: [
                        levelWidget(
                          onTap: () {},
                          title: 'Levels',
                          cubit: cubit,
                          gradientColor: AppColors.blueLevel,
                          margin: EdgeInsets.zero,
                          padding: EdgeInsets.zero,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  'Beginner'.tr(),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: textStyle(
                                    cubit,
                                    size: 18.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 110,
                                child: ButtonGlobal(
                                  padding: 0,
                                  onPressed: () async {
                                    if (CacheHelper.userType != 'Active') {
                                      cubit.loadLessonsBanner();
                                      cubit.loadLessonBanner();
                                    }
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const LessonsScreen(level: 1),
                                      ),
                                    );
                                    await cubit.getLevels(
                                        level: 1, type: 'text');
                                  },
                                  buttontext: "Texts".tr(),
                                  buttonDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.r),
                                      color: AppColors.blueLevel),
                                ),
                              ),
                              SizedBox(
                                width: 110,
                                child: ButtonGlobal(
                                  padding: 0,
                                  onPressed: () async {
                                    if (CacheHelper.userType != 'Active') {
                                      cubit.loadLessonsBanner();
                                      cubit.loadLessonBanner();
                                    }
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const LessonsScreen(level: 1),
                                      ),
                                    );
                                    await cubit.getLevels(
                                        level: 1, type: 'video');
                                  },
                                  buttontext: "Videos".tr(),
                                  buttonDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                    color: AppColors.redAccent,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Divider(),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  'Intermediate'.tr(),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: textStyle(
                                    cubit,
                                    size: 18.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 110,
                                child: ButtonGlobal(
                                  padding: 0,
                                  onPressed: () async {
                                    if (CacheHelper.userType != 'Active') {
                                      cubit.loadLessonsBanner();
                                      cubit.loadLessonBanner();
                                    }
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const LessonsScreen(level: 2),
                                      ),
                                    );
                                    if (cubit.listOfLevelTwo.isEmpty) {
                                      await cubit.getLevels(
                                          level: 2, type: 'text');
                                    }
                                  },
                                  buttontext: "Texts".tr(),
                                  buttonDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.r),
                                      color: AppColors.blueLevel),
                                ),
                              ),
                              SizedBox(
                                width: 110,
                                child: ButtonGlobal(
                                  padding: 0,
                                  onPressed: () async {
                                    if (CacheHelper.userType != 'Active') {
                                      cubit.loadLessonsBanner();
                                      cubit.loadLessonBanner();
                                    }
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const LessonsScreen(level: 2),
                                      ),
                                    );
                                    await cubit.getLevels(
                                        level: 2, type: 'video');
                                  },
                                  buttontext: "Videos".tr(),
                                  buttonDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.r),
                                      color: AppColors.redAccent),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Divider(),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  'Advanced'.tr(),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: textStyle(
                                    cubit,
                                    size: 18.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 110,
                                child: ButtonGlobal(
                                  padding: 0,
                                  onPressed: () async {
                                    if (CacheHelper.userType != 'Active') {
                                      cubit.loadLessonsBanner();
                                      cubit.loadLessonBanner();
                                    }
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const LessonsScreen(level: 3),
                                      ),
                                    );
                                    if (cubit.listOfLevelThree.isEmpty) {
                                      await cubit.getLevels(
                                          level: 3, type: 'text');
                                    }
                                  },
                                  buttontext: "Texts".tr(),
                                  buttonDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.r),
                                      color: AppColors.blueLevel),
                                ),
                              ),
                              SizedBox(
                                width: 110,
                                child: ButtonGlobal(
                                  padding: 0,
                                  onPressed: () async {
                                    if (CacheHelper.userType != 'Active') {
                                      cubit.loadLessonsBanner();
                                      cubit.loadLessonBanner();
                                    }
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const LessonsScreen(level: 3),
                                      ),
                                    );
                                    await cubit.getLevels(
                                        level: 3, type: 'video');
                                  },
                                  buttontext: "Videos".tr(),
                                  buttonDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.r),
                                      color: AppColors.redAccent),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          /*     bottomNavigationBar: NavigationBarTheme(
            data: NavigationBarThemeData(
                indicatorColor: AppColors.thirdAppColor.withOpacity(0.2),
                labelTextStyle: MaterialStateProperty.all(
                  textStyle(cubit,
                      color: AppColors.thirdAppColor,
                      size: 12.sp,
                      fontWeight: FontWeight.w700),
                ),
                labelBehavior:
                    NavigationDestinationLabelBehavior.onlyShowSelected),
            child: NavigationBar(
              elevation: 0,
              height: 55.h,
              backgroundColor: AppColors.white,
              selectedIndex: cubit.bottomNavIndex,
              animationDuration: const Duration(seconds: 0),
              onDestinationSelected: (index) {
                cubit.changeBottomNavIndex(index);
              },
              destinations: [
                NavigationDestination(
                  icon: const Icon(
                    CupertinoIcons.house,
                    color: AppColors.gray2,
                  ),
                  selectedIcon: const Icon(
                    CupertinoIcons.house_fill,
                    color: AppColors.thirdAppColor,
                  ),
                  label: 'Levels'.tr(),
                ),
                NavigationDestination(
                  icon: const Icon(
                    CupertinoIcons.square_list,
                    color: AppColors.gray2,
                  ),
                  selectedIcon: const Icon(
                    CupertinoIcons.square_list_fill,
                    color: AppColors.thirdAppColor,
                  ),
                  label: 'Rules'.tr(),
                ),
              ],
            ),
          ),*/
          /*  floatingActionButton: cubit.bottomNavIndex == 1
              ? Container(
                  decoration: BoxDecoration(
                    color: AppColors.thirdAppColor,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: AppColors.white,
                      width: 1.0,
                    ),
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.addRuleScreen);
                    },
                    icon: const Icon(
                      Icons.add,
                      color: AppColors.white,
                    ),
                  ),
                )
              : const SizedBox(),*/
        );
      },
    );
  }
}
