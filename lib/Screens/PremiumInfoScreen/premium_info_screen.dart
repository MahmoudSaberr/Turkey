import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:pen/Bloc/Cubit/app_cubit.dart';
import 'package:pen/Bloc/Cubit/app_states.dart';
import 'package:pen/Config/router.dart';
import 'package:pen/Screens/PaymentScreens/toggle_screen.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../Theme/app_colors.dart';
import '../../Theme/text_style.dart';
import '../../Widgets/animated_widget.dart';

class PremiumInfoScreen extends StatelessWidget {
  const PremiumInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> list = [
      'Once upgraded, you gain the ability to translate sentences with its unique features',
      'Enjoy watching all categorized grammar videos within the app privately and without ads',
      'No more interruptions—experience an ad-free environment by removing all ads within the app',
      'Any new updates will also be accessible to you for free',
    ];

    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if (state is PaymentOrderIDSuccessState) {
          Navigator.pushNamed(context, Routes.toggleScreen);
        }
      },
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Premium'.tr(),
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
              (state is PaymentInitialState ||
                      state is PaymentSuccessState ||
                      state is PaymentOrderIDLoadingState ||
                      state is PaymentOrderIDSuccessState)
                  ? const Positioned(
                      top: 0,
                      right: 0,
                      left: 0,
                      child: LinearProgressIndicator(
                        color: AppColors.thirdAppColor,
                      ),
                    )
                  : const SizedBox(),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Take pictures of both sides of your government-issued ID, and a picture from your gallery or camera to match',
                        style: textStyle(cubit, size: 14.sp),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Center(
                        child: Lottie.asset(
                          'assets/gifs/premium.json',
                          width: 250,
                          height: 250,
                          alignment: Alignment.center,
                        ),
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: list.length,
                          itemBuilder: (context, index) {
                            return TimelineTile(
                              isFirst: index == 0,
                              isLast: index == list.length - 1,
                              beforeLineStyle: const LineStyle(thickness: 5),
                              indicatorStyle: IndicatorStyle(
                                  width: 40,
                                  height: 40,
                                  // color: Colors.green,
                                  indicator: Container(
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Center(
                                      child: Icon(Icons.circle,
                                          color: Colors.grey),
                                    ),
                                  )),
                              alignment: TimelineAlign.center,
                              lineXY: 0,
                              startChild: index % 2 == 0
                                  ? AnimatedWidgets(
                                      delay: 300,
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        elevation: 10,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            list[index].tr(),
                                            style: textStyle(cubit,
                                                fontWeight: FontWeight.w500,
                                                size: 15),
                                          ),
                                        ),
                                      ),
                                    )
                                  : Container(),
                              endChild: index % 2 != 0
                                  ? AnimatedWidgets(
                                      delay: 300,
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        elevation: 10,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            list[index].tr(),
                                            style: textStyle(cubit,
                                                fontWeight: FontWeight.w500,
                                                size: 15),
                                          ),
                                        ),
                                      ),
                                    )
                                  : Container(),
                            );
                          }),
                      SizedBox(
                        height: 20.h,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: Container(
            height: 50,
            alignment: Alignment.center,
            child: InkWell(
              onTap: () async {
                await cubit.getFirstToken();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Next'.tr(),
                    style: textStyle(
                      cubit,
                      size: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  const Icon(
                    Icons.arrow_forward,
                    color: AppColors.defaultAppColor,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
