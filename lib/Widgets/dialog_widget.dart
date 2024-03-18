import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:giff_dialog/giff_dialog.dart';
import 'package:pen/Theme/app_colors.dart';
import 'package:pen/Theme/style.dart';

ShowDialogg(
    {context,
    required title,
    required description,
    required sharedKey,
    String? okString,
    String? canString,
    VoidCallback? okButton,
    VoidCallback? canButton,
    required bool okBut}) {
  return showDialog(
    context: context,
    builder: (_) => AssetGiffDialog(
      image: Image.asset(
        'assets/images/log-out.png',
        alignment: Alignment.center,
        fit: BoxFit.contain,
      ),
      title: Text(
        "$title",
        style: fontRegular.copyWith(
          fontSize: 25.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      description: Text(
        "$description",
        style: fontRegular.copyWith(),
        textAlign: TextAlign.center,

      ),
      buttonOkColor: Colors.red,
      buttonCancelColor: AppColors.defaultAppColor,
      buttonOkText: Text(
        okString!,
        style: fontRegular.copyWith(
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
      buttonCancelText: Text(
        canString!,
        style: fontRegular.copyWith(
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
      buttonRadius: 5,
      cornerRadius: 25,
      onOkButtonPressed: okButton,
      onCancelButtonPressed: canButton,
      entryAnimation: EntryAnimation.bottomRight,
      onlyOkButton: okBut,
    ),
  );
}
