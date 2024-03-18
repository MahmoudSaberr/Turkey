import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pen/Config/common_components.dart';
import 'package:pen/Widgets/alert_dialog.dart';

import '../../../Bloc/Cubit/app_cubit.dart';
import '../../../Config/ad_mob_services.dart';
import '../../../Config/cache_helper.dart';
import '../../../Theme/app_colors.dart';
import '../../../Theme/text_style.dart';

Widget buildTextWidget({required AppCubit cubit, required context}) {
  List<Widget> wordWidgets = [];

  for (int i = 0; i < cubit.defaultStatements.length; i++) {
    String turkey = cubit.statementsT[i].replaceAll('*', '.');
    String english = cubit.statementsE[i].replaceAll('*', '.');
    String arabic = cubit.statementsA[i].replaceAll('*', '.');
    // String url = cubit.url[i];
/*
    List<String> wordsModel =
        cubit.lessonModel!.statementsWords?.values.elementAt(i);
*/

    // Split the statement into words
    List<String> words = cubit.defaultStatements[i].replaceAll('*', '.').split(' ');

    // Create a list of GestureDetector for each word
    List<Widget> wordWidgetsForRow = words.map((word) {
      return GestureDetector(
        onTap: () {
          if (cubit.defaultStatements != cubit.statementsA) {
            if (CacheHelper.userType != 'Active') {
              AdMobServices.createInterstitialAd(cubit.interstitialAd);
            }
            if (cubit.lessonModel!.words![word] != null) {
              String englishWord = cubit.lessonModel!.words![word]!.english!;
              String arabicWord = cubit.lessonModel!.words![word]!.arabic!;
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
            }
          }
        },
        child: Directionality(
          textDirection: cubit.defaultStatements != cubit.statementsA
              ? TextDirection.ltr
              : TextDirection.rtl,
          child: Container(
            padding: cubit.lessonModel!.words![word] != null
                ? const EdgeInsets.symmetric(horizontal: 2.0)
                : EdgeInsets.zero,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: /*cubit.lessonModel!.words![word] != null
                  ? AppColors.liteSecondaryAppColor
                  :*/
                  Colors.transparent,
            ),
            child: Text(
              word,
              textDirection: cubit.defaultStatements != cubit.statementsA
                  ? TextDirection.ltr
                  : TextDirection.rtl,
              style: textStyle(
                cubit,
                fontFamily: cubit.defaultStatements != cubit.statementsA
                    ? 'ArchivoNarrow'
                    : 'Janna',
              ),
            ),
          ),
        ),
      );
    }).toList();

    // Add each word widget to the list
    wordWidgets.addAll(wordWidgetsForRow);

    // Add IconButton
    wordWidgets.add(
      InkWell(
        child: Icon(
          CupertinoIcons.info,
          color: AppColors.thirdAppColor,
          size: 18.w,
        ),
        onTap: () {
          if (CacheHelper.userType != 'Active') {
            AdMobServices.createInterstitialAd(cubit.interstitialAd);
            buildDialogToPremium(context: context, cubit: cubit);
          } else {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return CustomAlertDialog(
                  turkey: turkey,
                  english: english,
                  arabic: arabic,
                  //  words: wordsModel,
                  cubit: cubit,
                  //url:url
                );
              },
            );
          }
        },
      ),
    );
  }

  return Wrap(
    spacing: 6.w,
    runSpacing: 5,
    textDirection: cubit.defaultStatements != cubit.statementsA
        ? TextDirection.ltr
        : TextDirection.rtl,
    children: wordWidgets,
  );
}
