import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pen/Bloc/Cubit/app_cubit.dart';
import 'package:pen/Bloc/Cubit/app_states.dart';
import 'package:pen/Screens/LessonScreen/Widgets/image_widget.dart';
import 'package:pen/Screens/LessonScreen/Widgets/sentecnes_widget.dart';
import 'package:pen/Widgets/button_global.dart';

import '../../Config/ad_mob_services.dart';
import '../../Config/cache_helper.dart';
import '../../Config/router.dart';
import '../../Theme/app_colors.dart';
import '../../Theme/text_style.dart';

class LessonScreen extends StatelessWidget {
  const LessonScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Lesson'.tr(),
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
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
/*
                  Container(
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: AppColors.gray2.withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(30),
                      color: AppColors.white,
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Content'.tr(),
                          style: textStyle(
                            cubit,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${cubit.lessonModel!.content} saddasddddddddddddddaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
                          style: textStyle(cubit),
                        ),
                      ],
                    ),
                  ),
*/
                  SizedBox(
                    height: 10.h,
                  ),
                  if (cubit.lessonModel!.videoUrl != '-') ...[
                    /*           ButtonGlobal(
                      padding: 0,
                      onPressed: () async {
                        cubit.videoLink = cubit.lessonModel!.videoUrl;
                        Navigator.pushNamed(context, Routes.videoScreen);
                      },
                      buttontext: "Watch the video".tr(),
                      buttonDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: AppColors.redAccent),
                    ),
                */
                    ImageWithPlayButton(
                      cubit: cubit,
                    ),
                  ],
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          if (cubit.defaultStatements != cubit.statementsT) {
                            cubit.changeStatementsLanguage(cubit.statementsT);
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.w, vertical: 4.h),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColors.gray2.withOpacity(0.5)),
                            borderRadius: BorderRadius.circular(30),
                            color: cubit.defaultStatements == cubit.statementsT
                                ? AppColors.defaultAppColor
                                : AppColors.white,
                          ),
                          child: Text(
                            'Turkey'.tr(),
                            style: textStyle(
                              cubit,
                              fontWeight:
                                  cubit.defaultStatements != cubit.statementsT
                                      ? FontWeight.normal
                                      : FontWeight.bold,
                              color:
                                  cubit.defaultStatements != cubit.statementsT
                                      ? AppColors.black
                                      : AppColors.white,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          if (cubit.defaultStatements != cubit.statementsE) {
                            cubit.changeStatementsLanguage(cubit.statementsE);
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.w, vertical: 4.h),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColors.gray2.withOpacity(0.5)),
                            borderRadius: BorderRadius.circular(30),
                            color: cubit.defaultStatements == cubit.statementsE
                                ? AppColors.defaultAppColor
                                : AppColors.white,
                          ),
                          child: Text(
                            'englishLanguage'.tr(),
                            style: textStyle(
                              cubit,
                              fontWeight:
                                  cubit.defaultStatements != cubit.statementsE
                                      ? FontWeight.normal
                                      : FontWeight.bold,
                              color:
                                  cubit.defaultStatements != cubit.statementsE
                                      ? AppColors.black
                                      : AppColors.white,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          if (cubit.defaultStatements != cubit.statementsA) {
                            cubit.changeStatementsLanguage(cubit.statementsA);
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.w, vertical: 4.h),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColors.gray2.withOpacity(0.5)),
                            borderRadius: BorderRadius.circular(30),
                            color: cubit.defaultStatements == cubit.statementsA
                                ? AppColors.defaultAppColor
                                : AppColors.white,
                          ),
                          child: Text(
                            'arabicLanguage'.tr(),
                            style: textStyle(
                              cubit,
                              fontWeight:
                                  cubit.defaultStatements != cubit.statementsA
                                      ? FontWeight.normal
                                      : FontWeight.bold,
                              color:
                                  cubit.defaultStatements != cubit.statementsA
                                      ? AppColors.black
                                      : AppColors.white,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          if (CacheHelper.userType != 'Active') {
                            cubit.loadSentencesPBanner();
                          }
                          Navigator.pushNamed(context, Routes.sentencesScreen);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.w, vertical: 4.h),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColors.gray2.withOpacity(0.5)),
                            borderRadius: BorderRadius.circular(30),
                            color: AppColors.liteSecondaryAppColor,
                          ),
                          child: const Icon(CupertinoIcons.search_circle),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: AppColors.gray2.withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(30),
                      color: AppColors.white,
                    ),
                    child: Column(
                      children: [
                        Text(
                          cubit.lessonModel!.title!,
                          style: textStyle(
                            cubit,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'ArchivoNarrow',
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        buildTextWidget(cubit: cubit, context: context)
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  ButtonGlobal(
                    padding: 0,
                    onPressed: () async {
                      if (CacheHelper.userType != 'Active') {
                        cubit.loadSentencesPBanner();
                      }
                      Navigator.pushNamed(context, Routes.sentencesScreen);
                    },
                    buttontext: "Display the sentences separately".tr(),
                    buttonDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: AppColors.amber500),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: CacheHelper.userType != 'Active'
              ? AdMobServices.showBannerAds(cubit.lessonBanner!)
              : const SizedBox(),
        );
      },
    );
  }
}
