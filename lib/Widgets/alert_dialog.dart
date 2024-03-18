import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pen/Bloc/Cubit/app_cubit.dart';
import 'package:pen/Bloc/Cubit/app_states.dart';
import 'package:pen/Config/common_components.dart';
import 'package:pen/Screens/LessonScreen/Widgets/voice_widget.dart';
import 'package:pen/Widgets/button_global.dart';

import '../Theme/app_colors.dart';
import '../Theme/style.dart';

class CustomAlertDialog extends StatelessWidget {
  //final Color bgColor;
  // final String title;
  final String turkey;
  final String english;
  final String arabic;
  final String? positiveBtnText;
  final List<String>? words;
  final AppCubit cubit;
  final String? negativeBtnText;
  final String? url;
  final dynamic onPositivePressed;
  final dynamic onNegativePressed;
  final double circularBorderRadius;

  const CustomAlertDialog({
    super.key,
    // required this.title,
    required this.turkey,
    this.circularBorderRadius = 15.0,
    //this.bgColor,
    this.words,
    required this.cubit,
    this.positiveBtnText,
    this.negativeBtnText,
    this.url,
    this.onPositivePressed,
    this.onNegativePressed,
    required this.english,
    required this.arabic,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return AlertDialog(
          // title: Text(
          //   title,
          //   style: fontRegularBold.copyWith(color: Colors.black),
          // ),
          content: Column(
            children: [
              ElevatedButton(
                onPressed: () async {
                  await cubit.textToSpeech(turkey);
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.transparent,
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(16),
                ),
                child: const Icon(
                  Icons.volume_up,
                  color: AppColors.defaultAppColor,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                padding: const EdgeInsets.all(12.0),
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.gray2.withOpacity(0.5)),
                  borderRadius: BorderRadius.circular(30),
                  color: AppColors.white,
                ),
                child: Text(
                  turkey,
                  textAlign: TextAlign.center,
                  style: fontRegular.copyWith(color: Colors.black),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                padding: const EdgeInsets.all(12.0),
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.gray2.withOpacity(0.5)),
                  borderRadius: BorderRadius.circular(30),
                  color: AppColors.white,
                ),
                child: Text(
                  english,
                  textAlign: TextAlign.center,
                  style: fontRegular.copyWith(color: Colors.black),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                padding: const EdgeInsets.all(12.0),
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.gray2.withOpacity(0.5)),
                  borderRadius: BorderRadius.circular(30),
                  color: AppColors.white,
                ),
                child: Text(
                  arabic,
                  textAlign: TextAlign.center,
                  style: fontRegular.copyWith(color: Colors.black),
                ),
              ),
              if (words != null) ...[
                SizedBox(
                  height: 10.h,
                ),
                myDivider(),
                SizedBox(
                  height: 10.h,
                ),
                Wrap(
                  spacing: 6.w,
                  children: [
                    for (var word in words!)
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          String englishWord =
                              cubit.lessonModel!.words![word]!.english!;
                          String arabicWord =
                              cubit.lessonModel!.words![word]!.arabic!;
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return CustomAlertDialog(
                                turkey: word,
                                english: englishWord,
                                arabic: arabicWord,
                                cubit: cubit,
                              );
                            },
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColors.gray2.withOpacity(0.5)),
                            borderRadius: BorderRadius.circular(30),
                            color: AppColors.white,
                          ),
                          child: Text(
                            word,
                            textAlign: TextAlign.center,
                            style: fontRegular.copyWith(color: Colors.black),
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ],
          ),
          scrollable: true,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(circularBorderRadius)),
          actions: [
            negativeBtnText != null
                ? TextButton(
                    child: Text(
                      negativeBtnText!,
                      style: fontMedium.copyWith(color: Colors.black),
                    ),
                    //textColor: Theme.of(context).accentColor,
                    onPressed: () {
                      Navigator.of(context).pop();
                      if (onNegativePressed != null) {
                        onNegativePressed();
                      }
                    },
                  )
                : const SizedBox(),
            positiveBtnText != null
                ? TextButton(
                    child: Text(
                      positiveBtnText!,
                      style: fontMedium.copyWith(color: Colors.black),
                    ),
                    //textColor: Theme.of(context).accentColor,
                    onPressed: () {
                      if (onPositivePressed != null) {
                        onPositivePressed();
                      }
                    },
                  )
                : const SizedBox(),
          ],
        );
      },
    );
  }
}
