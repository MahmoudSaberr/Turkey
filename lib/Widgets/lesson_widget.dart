import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pen/Theme/app_colors.dart';
import 'package:pen/Theme/text_style.dart';

lessonWidget(
    {onTap,
    required title,
    required cubit,
    required icon,
    required onPressed}) {
  return onTap != null
      ? InkWell(
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.only(bottom: 5.h),
            child: Card(
              margin: const EdgeInsets.symmetric(vertical: 7),
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7.0),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.0),
                  gradient: const LinearGradient(
                    stops: [0.02, 0.02],
                    colors: [AppColors.thirdAppColor, AppColors.white],
                  ),
                ),
                padding: EdgeInsetsDirectional.symmetric(
                  vertical: 10.h,
                  horizontal: 20.w,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: textStyle(
                          cubit,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'ArchivoNarrow',
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: onPressed,
                      icon: Icon(
                        icon,
                        color: AppColors.thirdAppColor,
                        size: 28.w,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      : Padding(
          padding: EdgeInsets.only(bottom: 5.h),
          child: Card(
            margin: const EdgeInsets.symmetric(vertical: 7),
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7.0),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.0),
                gradient: const LinearGradient(
                  stops: [0.02, 0.02],
                  colors: [AppColors.thirdAppColor, AppColors.white],
                ),
              ),
              padding: EdgeInsetsDirectional.symmetric(
                vertical: 10.h,
                horizontal: 20.w,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: textStyle(
                        cubit,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'ArchivoNarrow',
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: onPressed,
                    icon: Icon(
                      icon,
                      color: AppColors.thirdAppColor,
                      size: 28.w,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
}
