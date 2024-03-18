import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pen/Bloc/Cubit/app_cubit.dart';
import 'package:pen/Bloc/Cubit/app_states.dart';
import 'package:pen/Theme/text_style.dart';

import '../../Config/ad_mob_services.dart';
import '../../Config/cache_helper.dart';
import '../../Theme/app_colors.dart';
import '../../Widgets/alert_dialog.dart';
import '../../Widgets/lesson_widget.dart';
import '../../Widgets/text_field_widget.dart';

class SentencesScreen extends StatelessWidget {
  const SentencesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();

    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Sentences'.tr(),
              style: textStyle(
                cubit,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
            backgroundColor: AppColors.white,
            elevation: 0,
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                SizedBox(
                  height: 15.h,
                ),
                GlobalFormField(
                  controller: searchController,
                  type: TextInputType.text,
                  prefixIcon: const Icon(CupertinoIcons.search_circle),
                  onChange: (value) {
                    cubit.searchSentences(value);
                  },
                  validate: (value) {},
                  label: 'Search'.tr(),
                  cubit: cubit,
                ),
                SizedBox(
                  height: 15.h,
                ),
                searchController.text.isEmpty
                    ? Expanded(
                        child: ListView.builder(
                          physics: const AlwaysScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: cubit.statementsT.length,
                          itemBuilder: (BuildContext context, index) {
                            /*
                      String turkey =
                          cubit.lessonModel!.statements!.keys.elementAt(index);
                      Statement statement = cubit
                          .lessonModel!.statements!.values
                          .elementAt(index);*/

                            return lessonWidget(
                              title: cubit.statementsT[index],
                              cubit: cubit,
                              icon: Icons.translate_outlined,
                              onPressed: () {
                                if (CacheHelper.userType != 'Active') {
                                  AdMobServices.createInterstitialAd(
                                      cubit.interstitialAd);
                                  AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.info,
                                    animType: AnimType.rightSlide,
                                    title: 'To Premium'.tr(),
                                    desc:
                                        "Once upgraded, you gain the ability to translate sentences with its unique features"
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
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return CustomAlertDialog(
                                        turkey: cubit.statementsT[index],
                                        english: cubit.statementsE[index],
                                        arabic: cubit.statementsA[index],
                                        //words: ['Geliştirici', 'evim'],
                                        cubit: cubit,
                                        //url: cubit.url[index]
                                      );
                                    },
                                  );
                                }
                              },
                            );
                          },
                        ),
                      )
                    : Expanded(
                        child: ListView.builder(
                          physics: const AlwaysScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: cubit.searchStatements.length,
                          itemBuilder: (BuildContext context, index) {
                            /*
                      String turkey =
                          cubit.lessonModel!.statements!.keys.elementAt(index);
                      Statement statement = cubit
                          .lessonModel!.statements!.values
                          .elementAt(index);*/
                            String englishStatement =
                                cubit.lessonModel!.enStatements![index];
                            String arabicStatement =
                                cubit.lessonModel!.arStatements![index];
                            //   String urlStatement = cubit.lessonModel!.statements![cubit.searchStatements[index]]!.url!;

                            return lessonWidget(
                              title: cubit.searchStatements[index],
                              cubit: cubit,
                              icon: Icons.translate_outlined,
                              onPressed: () {
                                if (CacheHelper.userType != 'Active') {
                                  AdMobServices.createInterstitialAd(
                                      cubit.interstitialAd);
                                  AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.info,
                                    animType: AnimType.rightSlide,
                                    title: 'To Premium'.tr(),
                                    desc:
                                        "Once upgraded, you gain the ability to translate sentences with its unique features"
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
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return CustomAlertDialog(
                                        turkey: cubit.searchStatements[index],
                                        english: englishStatement,
                                        arabic: arabicStatement,
                                        //words: ['Geliştirici', 'evim'],
                                        cubit: cubit,
                                        //url:urlStatement
                                      );
                                    },
                                  );
                                }
                              },
                            );
                          },
                        ),
                      ),
              ],
            ),
          ),
          bottomNavigationBar: CacheHelper.userType != 'Active'
              ? AdMobServices.showBannerAds(cubit.sentencesBanner!)
              : const SizedBox(),
        );
      },
    );
  }
}
