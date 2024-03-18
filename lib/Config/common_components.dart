import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pen/Theme/style.dart';
import 'package:lottie/lottie.dart';
import 'package:pen/Theme/text_style.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Bloc/Cubit/app_cubit.dart';
import '../Theme/app_colors.dart';
import 'cache_helper.dart';

buildRadioListTile(
  BuildContext context, {
  required AppCubit cubit,
  required dynamic radioValue,
  required dynamic groupValue,
  required Function(dynamic)? onChangedFun,
  required String titleText,
  Widget? secondaryWidget,
}) {
  return RadioListTile(
    contentPadding: const EdgeInsets.symmetric(horizontal: 2.0),
    value: radioValue,
    groupValue: groupValue,
    onChanged: onChangedFun,
    activeColor: AppColors.thirdAppColor,
    title: Text(
      titleText,
      style: textStyle(
        cubit,
      ),
    ),
    tileColor: AppColors.white,
    secondary: secondaryWidget,
  );
}

buildDialogToPremium({required BuildContext context, required AppCubit cubit}) {
  return AwesomeDialog(
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
}

Column buildLanguageColumn(AppCubit cubit, state, context) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      buildRadioListTile(
        context,
        cubit: cubit,
        radioValue: 'tr',
        groupValue: cubit.appLanguage,
        onChangedFun: (newVal) {
          cubit.changeAppLanguage(newVal!);
          EasyLocalization.of(context)!.setLocale(const Locale('tr', 'TR'));
        },
        titleText: 'Turkey'.tr(),
      ),
      buildRadioListTile(
        context,
        cubit: cubit,
        radioValue: 'en',
        groupValue: cubit.appLanguage,
        onChangedFun: (newVal) {
          cubit.changeAppLanguage(newVal!);
          EasyLocalization.of(context)!.setLocale(const Locale('en', 'US'));
        },
        titleText: 'englishLanguage'.tr(),
      ),
      ///////////////////////////
      buildRadioListTile(
        context,
        cubit: cubit,
        radioValue: 'ar',
        groupValue: cubit.appLanguage,
        onChangedFun: (newVal) {
          cubit.changeAppLanguage(newVal!);
          EasyLocalization.of(context)!.setLocale(const Locale('ar', 'EG'));
        },
        titleText: 'arabicLanguage'.tr(),
      ),
    ],
  );
}

Container buildNotificationOptionRow(BuildContext context, String title,
    IconData icon, bool isActive, Function(bool) onChange, AppCubit cubit) {
  return Container(
    color: AppColors.white,
    padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 14.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              icon,
              color: AppColors.defaultAppColor,
            ),
            SizedBox(
              width: 35.w,
            ),
            Text(title, style: textStyle(cubit, fontWeight: FontWeight.w600)),
          ],
        ),
        Transform.scale(
          scale: 0.7,
          child: CupertinoSwitch(
            activeColor: AppColors.thirdAppColor,
            value: isActive,
            onChanged: onChange,
          ),
        )
      ],
    ),
  );
}

/*navigateTo(context, widget, {void Function()? than}) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    ).then((value) => than);*/

Future<void> navigateToAndFinish(context, widget) =>
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => widget,
        ), (Route<dynamic> route) {
      return false;
    });

void navigateToAndReplacement(context, widget) => Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      /*      (Route<dynamic> route){
      return false;
    }*/
    );

launchUrlFun(String url) async {
  final Uri uri = url.contains('https')
      ? Uri.parse(url)
      : Uri(
          scheme: 'https',
          host: url,
        );
  // final Uri uri=Uri.parse(url) ;
  if (!await launchUrl(
    uri,
    mode: LaunchMode.externalApplication,
  )) {
    throw 'Cant not launch url';
  }
}

makeCall(String phone) async {
  final Uri uri = Uri(
    scheme: 'tel',
    path: phone,
  );
  if (!await launchUrl(
    uri,
    mode: LaunchMode.externalApplication,
  )) {
    throw 'Cant not launch url';
  }
}

void navigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

//=======================================================================================================================================================

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context, MaterialPageRoute(builder: (context) => widget), (route) => false);

Widget myDivider() {
  return Container(
    color: AppColors.white,
    padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 8),
    child: Container(
      width: 200.w,
      height: 3.0,
      decoration: BoxDecoration(
          color: AppColors.darkMainColor,
          borderRadius: BorderRadius.circular(15)),
    ),
  );
}

class CommonComponents {
  static PreferredSizeWidget commonAppBar({
    required Widget title,
  }) {
    return AppBar(
      title: title,
      centerTitle: true,
    );
  }

  static void showCustomizedSnackBar(
      {required BuildContext context, required String title}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          title,
          style: TextStyle(
            fontSize: 14.0.sp,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(milliseconds: 900),
        backgroundColor: Colors.orange,
      ),
    );
  }

  static Future<void> loading(BuildContext context) async {
    await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => Center(
        child: SizedBox(
          height: 50.0.h,
          width: 50.0.w,
          child: CircularProgressIndicator(
            valueColor: const AlwaysStoppedAnimation(Colors.blue),
            strokeWidth: 5.0.w,
          ),
        ),
      ),
    );
  }

  static initSharedPreferences() async {
    await CacheHelper.init();
  }

  static void saveData({required String key, required dynamic value}) {
    CacheHelper.saveData(key: key, value: value);
    /*SharedPreferences prefs = await SharedPreferences.getInstance();
    if (value is String) {
      return await prefs.setString(key, value);
    } else if (value is bool) {
      return await prefs.setBool(key, value);
    } else {
      return await prefs.setInt(key, value);
    }*/
  }

  static dynamic getSavedData(key) {
    /* SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get(key);*/
    return CacheHelper.getData(key: key);
  }

  static deleteSavedData(key) {
    /*  SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);*/
    CacheHelper.removeData(key: key);
  }

  static void getSnackBarWithServerError(BuildContext context) {
    showCustomizedSnackBar(context: context, title: "يوجد خطأ بالسيرفر");
  }
}
/*

Column emptyWidget(title) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Center(
        child: Lottie.asset('assets/gifs/empty.json',
            width: 300,
            height: 200,
            alignment: Alignment.center,
            fit: BoxFit.fill),
      ),
      const SizedBox(
        height: 20,
      ),
      Text(
        title,
        style: fontRegularBold.copyWith(color: AppColors.defaultAppColor),
      ),
    ],
  );
}
*/

void showToast({
  required String msg,
  required ToastStates state,
}) =>
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: AppColors.thirdAppColor,
        textColor: AppColors.white,
        fontSize: 16.0);

Color _chooseToastColor(ToastStates state) {
  switch (state) {
    case ToastStates.SUCCESS:
      return Colors.green;
    case ToastStates.WARNING:
      return Colors.yellow;
    case ToastStates.ERROR:
      return Colors.red;
  }
}

// ignore: constant_identifier_names
enum ToastStates { SUCCESS, ERROR, WARNING }

Locale currentLocaleApp = const Locale("ar");

Widget defaultTextButton({
  required function,
  required String text,
  required TextStyle style,
}) =>
    TextButton(
      onPressed: function,
      child: Text(text, style: style),
    );
