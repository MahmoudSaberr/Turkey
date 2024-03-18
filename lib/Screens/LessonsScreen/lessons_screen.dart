import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pen/Bloc/Cubit/app_cubit.dart';
import 'package:pen/Bloc/Cubit/app_states.dart';
import 'package:pen/Config/cache_helper.dart';
import 'package:pen/Widgets/lesson_widget.dart';
import 'package:shimmer/shimmer.dart';

import '../../Config/ad_mob_services.dart';
import '../../Theme/app_colors.dart';
import '../../Theme/text_style.dart';
import '../../Widgets/text_field_widget.dart';

class LessonsScreen extends StatelessWidget {
  const LessonsScreen({super.key, required this.level});

  final int level;

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
              'Lessons'.tr(),
              style: textStyle(
                cubit,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
            backgroundColor: AppColors.white,
            elevation: 0,
          ),
          body: Stack(
            children: [
              (state is GetLessonLoadingState)
                  ? const Positioned(
                      top: 0,
                      right: 0,
                      left: 0,
                      child: LinearProgressIndicator(),
                    )
                  : const SizedBox(),
              Padding(
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
                        cubit.search(value, level);
                      },
                      validate: (value) {},
                      label: 'Search'.tr(),
                      cubit: cubit,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    /*Center(child: emptyWidget('No Lessons yet'.tr(), cubit))*/
                    state is GetLevelLoadingState?
                        ? Expanded(
                            child: ListView.builder(
                              physics: const AlwaysScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: 8,
                              itemBuilder: (BuildContext context, index) {
                                return Shimmer(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.grey[300]!,
                                      Colors.grey[100]!,
                                      Colors.grey[300]!,
                                    ],
                                  ),
                                  child: Card(
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 7),
                                    elevation: 1,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(7.0),
                                    ),
                                    child: Container(
                                      height: 60.h,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(7.0),
                                        gradient: const LinearGradient(
                                          stops: [0.02, 0.02],
                                          colors: [
                                            AppColors.thirdAppColor,
                                            AppColors.white
                                          ],
                                        ),
                                      ),
                                      padding: EdgeInsetsDirectional.symmetric(
                                        vertical: 10.h,
                                        horizontal: 20.w,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'title',
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                            style: textStyle(cubit,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.transparent),
                                          ),
                                          Icon(
                                            CupertinoIcons.arrow_right_circle,
                                            color: AppColors.thirdAppColor,
                                            size: 28.w,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        : searchController.text.isEmpty
                            ? Expanded(
                                child: ListView.builder(
                                  physics:
                                      const AlwaysScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: level == 1
                                      ? cubit.listOfLevelOne.length
                                      : level == 2
                                          ? cubit.listOfLevelTwo.length
                                          : cubit.listOfLevelThree.length,
                                  itemBuilder: (BuildContext context, index) {
                                    return lessonWidget(
                                        title: level == 1
                                            ? cubit.listOfLevelOne[index].title
                                            : level == 2
                                                ? cubit
                                                    .listOfLevelTwo[index].title
                                                : cubit.listOfLevelThree[index]
                                                    .title,
                                        cubit: cubit,
                                        icon: CupertinoIcons.arrow_right_circle,
                                        onPressed: () async {
                                          if (level == 1) {
                                            await cubit.getLesson(
                                                id: cubit
                                                    .listOfLevelOne[index].id!,
                                                context: context);
                                          } else if (level == 2) {
                                            await cubit.getLesson(
                                                id: cubit
                                                    .listOfLevelTwo[index].id!,
                                                context: context);
                                          } else {
                                            await cubit.getLesson(
                                                id: cubit
                                                    .listOfLevelThree[index]
                                                    .id!,
                                                context: context);
                                          }
                                        });
                                  },
                                ),
                              )
                            : Expanded(
                                child: ListView.builder(
                                  physics:
                                      const AlwaysScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: level == 1
                                      ? cubit.listOfSearchResultOne.length
                                      : level == 2
                                          ? cubit.listOfSearchResultTwo.length
                                          : cubit
                                              .listOfSearchResultThree.length,
                                  itemBuilder: (BuildContext context, index) {
                                    return lessonWidget(
                                        title: level == 1
                                            ? cubit.listOfSearchResultOne[index]
                                                .title
                                            : level == 2
                                                ? cubit
                                                    .listOfSearchResultTwo[
                                                        index]
                                                    .title
                                                : cubit
                                                    .listOfSearchResultThree[
                                                        index]
                                                    .title,
                                        cubit: cubit,
                                        icon: CupertinoIcons.arrow_right_circle,
                                        onPressed: () async {
                                          if (level == 1) {
                                            await cubit.getLesson(
                                                id: cubit
                                                    .listOfSearchResultOne[index].id!,
                                                context: context);
                                          } else if (level == 2) {
                                            await cubit.getLesson(
                                                id: cubit
                                                    .listOfSearchResultTwo[index].id!,
                                                context: context);
                                          } else {
                                            await cubit.getLesson(
                                                id: cubit
                                                    .listOfSearchResultThree[index]
                                                    .id!,
                                                context: context);
                                          }
                                        });
                                  },
                                ),
                              ),
                  ],
                ),
              ),
            ],
          ),
          bottomNavigationBar: CacheHelper.userType != 'Active'
              ? AdMobServices.showBannerAds(cubit.lessonsBanner!)
              : const SizedBox(),
        );
      },
    );
  }
}
