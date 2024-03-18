import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pen/Bloc/Cubit/app_cubit.dart';

import 'app_colors.dart';

class CustomTheme {
  static MaterialColor mainAppColor =
  const MaterialColor(0xff3468C0, <int, Color>{
    50: Color(0xff3468C0),
    100: Color(0xff3468C0),
    200: Color(0xff3468C0),
    300: Color(0xff3468C0),
    400: Color(0xff3468C0),
    500: Color(0xff3468C0),
    600: Color(0xff3468C0),
    700: Color(0xff3468C0),
    800: Color(0xff3468C0),
    900: Color(0xff3468C0),
  });

  static MaterialColor mainAppColorDark =
      const MaterialColor(0xffaf8805, <int, Color>{
    50: Color(0xffaf8805),
    100: Color(0xffaf8805),
    200: Color(0xffaf8805),
    300: Color(0xffaf8805),
    400: Color(0xffaf8805),
    500: Color(0xffaf8805),
    600: Color(0xffaf8805),
    700: Color(0xffaf8805),
    800: Color(0xffaf8805),
    900: Color(0xffaf8805),
  });

  static ThemeData lightTheme(BuildContext context) {
    final theme = Theme.of(context);
    return ThemeData(
      fontFamily: AppCubit.get(context).fontFamily,
      dialogBackgroundColor: AppColors.white,
      scaffoldBackgroundColor: AppColors.kBgColor,
      colorScheme: ColorScheme.fromSwatch(
        backgroundColor: AppColors.kBgColor,
        brightness: Brightness.light,
        primarySwatch: mainAppColor,
        accentColor: AppColors.thirdAppColor,
      ),
      textTheme: theme.textTheme.apply(fontFamily: AppCubit.get(context).fontFamily),
      appBarTheme: const AppBarTheme(
        color: AppColors.kBgColor,
        foregroundColor: AppColors.defaultAppColor,
        elevation: 0.5,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColors.thirdAppColor,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
      useMaterial3: true,
      dividerColor: AppColors.defaultAppColor,
    );
  }

  static ThemeData darkTheme(BuildContext context) {
    final theme = Theme.of(context);

    return ThemeData(
      timePickerTheme: const TimePickerThemeData(
        backgroundColor: AppColors.darkMainColor,
          hourMinuteTextColor: AppColors.white,
          dayPeriodTextColor: AppColors.white,
          helpTextStyle: TextStyle(
            color: AppColors.white
          )
      ),
      fontFamily: "Janna",
      textTheme: theme.textTheme.apply(fontFamily: 'Janna'),
      colorScheme: ColorScheme.fromSwatch(
        backgroundColor: AppColors.darkMainColor,
        brightness: Brightness.dark,
       // primaryColorDark: AppColors.darkMainColor,
        primarySwatch: mainAppColorDark,
        accentColor: AppColors.darkSecondaryColor,
      ),
      appBarTheme: const AppBarTheme(
        color: AppColors.darkMainColor,
        elevation: 0.5,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColors.defaultAppColor,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
      useMaterial3: true,
      dividerColor: AppColors.defaultAppColor,
    );
  }
}
