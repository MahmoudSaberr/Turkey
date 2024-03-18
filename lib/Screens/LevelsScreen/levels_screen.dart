/*
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pen/Bloc/Cubit/app_cubit.dart';
import 'package:pen/Bloc/Cubit/app_states.dart';
import 'package:pen/Screens/LessonsScreen/lessons_screen.dart';
import 'package:pen/Screens/LevelsScreen/widgets/level_widget.dart';
import 'package:pen/Theme/app_colors.dart';

import '../../Config/ad_mob_services.dart';
import '../../Config/cache_helper.dart';
import '../../Config/images.dart';
import '../../Config/router.dart';
import '../../Theme/text_style.dart';

class LevelsScreen extends StatelessWidget {
  const LevelsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);

        return Scaffold(
          extendBody: true,
          appBar: AppBar(
            title: Text(
              'Levels'.tr(),
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
            child: Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                CacheHelper.userType != 'Active'
                    ? AdMobServices.showBannerAds(cubit.levelsBanner!)
                    : SizedBox(
                        height: 40.h,
                      ),
                levelWidget(
                  onTap: () async {
                    if (CacheHelper.userType != 'Active') {
                      cubit.loadLessonsBanner();
                      cubit.loadLessonBanner();
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LessonsScreen(level: 1),
                      ),
                    );
                    if (cubit.listOfLevelOne.isEmpty) {
                      await cubit.getLevels(level: 1);
                    }
                  },
                  title: 'Beginner',
                  cubit: cubit,
                  gradientColor: AppColors.redLevel,
                ),
                SizedBox(
                  height: 20.h,
                ),
                levelWidget(
                  onTap: () async {
                    if (CacheHelper.userType != 'Active') {
                      cubit.loadLessonsBanner();
                      cubit.loadLessonBanner();
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LessonsScreen(level: 2),
                      ),
                    );
                    if (cubit.listOfLevelTwo.isEmpty) {
                      await cubit.getLevels(level: 2);
                    }
                  },
                  title: 'Intermediate',
                  cubit: cubit,
                  gradientColor: AppColors.greenLevel,
                ),
                SizedBox(
                  height: 20.h,
                ),
                levelWidget(
                  onTap: () async {
                    if (CacheHelper.userType != 'Active') {
                      cubit.loadLessonsBanner();
                      cubit.loadLessonBanner();
                    }

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LessonsScreen(level: 3),
                      ),
                    );
                    if (cubit.listOfLevelThree.isEmpty) {
                      await cubit.getLevels(level: 3);
                    }
                  },
                  title: 'Advanced',
                  cubit: cubit,
                  gradientColor: AppColors.blueLevel,
                ),
              ],
            ),
          ),
          */
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
              : const SizedBox(),*//*

        );
      },
    );
  }
}
*/
