import 'package:flutter/material.dart';
import 'package:pen/Bloc/Cubit/app_cubit.dart';
import 'package:pen/Theme/app_colors.dart';
import 'package:pen/Theme/style.dart';

TextStyle textStyle(AppCubit cubit,
    {double? size,
    double? spacing,
    FontWeight? fontWeight,
    String? fontFamily,
    Color? color,
    double? letterSpaceing,
    TextDecoration? textDecoration}) {
  return fontRegular.copyWith(
      fontSize: size,
      letterSpacing: spacing,
      fontWeight: fontWeight,
      fontFamily: fontFamily ?? cubit.fontFamily,
      //    fontFamily: EasyLocalization.of(context)!.locale == Locale('tr', 'TR') ? 'ArchivoNarrow' : 'Janna',
      color: color ?? AppColors.black,
      decoration: textDecoration);
}
