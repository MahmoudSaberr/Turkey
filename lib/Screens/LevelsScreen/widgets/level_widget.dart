import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pen/Theme/text_style.dart';

import '../../../Config/images.dart';
import '../../../Theme/app_colors.dart';

InkWell levelWidget(
    {required title,
    required cubit,
    required gradientColor,
    required onTap,
    padding,
    margin}) {
  return InkWell(
    onTap: onTap,
    child: Padding(
      padding: padding ??const EdgeInsets.symmetric(horizontal:  15.0),
      child: Card(
        margin:margin ?? const EdgeInsets.symmetric(vertical:  7),
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7.0),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7.0),
            gradient: LinearGradient(
              stops: const [0.01, 1],
              colors: [gradientColor, AppColors.white],
            ),
          ),
          padding: EdgeInsetsDirectional.symmetric(
            vertical: 25.h,
            horizontal: 10.w,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: Image.asset(
                  Images.level,
                  width: 55.w,
                ),
              ),
              Text(
                '$title'.tr(),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: textStyle(
                  cubit,
                  size: 28.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox()
            ],
          ),
        ),
      ),
    ),
  );
}
