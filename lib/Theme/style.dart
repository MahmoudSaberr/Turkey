import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

class Dimensions {
  static double fontSizeExtraSmallSamll = 8;
  static double fontSizeExtraSmall = 10;
  static double fontSizeSmall = 12;
  static double fontSizeDefault = 14;
  static double fontSizeReasonHeading = 14;
  static double fontSizeReasonText = 12;
  static double fontSizeLarge = 16;
  static double fontSizeExtraLarge = 18;
  static double fontSizeExtraLarge22 = 22;
  static double fontSizeOverLarge = 26;
}

class ScreenSize {
  BuildContext context;

  ScreenSize(this.context);

  double get mainHeight => MediaQuery.of(context).size.height;

  double get mainWidth => MediaQuery.of(context).size.width;
}

final fontSizeSmall = TextStyle(
  fontFamily: 'Janna',
  fontWeight: FontWeight.w400,
  fontSize: Dimensions.fontSizeExtraSmall.sp,
  color: Colors.black,
);
final fontSizeSmallGray = TextStyle(
  fontFamily: 'Janna',
  fontWeight: FontWeight.w400,
  color: AppColors.greyColor,
  fontSize: Dimensions.fontSizeExtraSmall.sp,
);

final fontSizeReasonText = TextStyle(
  fontFamily: 'Janna',
  fontWeight: FontWeight.w400,
  color: Colors.black,
  fontSize: Dimensions.fontSizeReasonText.sp,
);

final fontSizeAuth = TextStyle(
  fontFamily: 'Janna',
  fontWeight: FontWeight.w500,
  color: Colors.black,
  fontSize: Dimensions.fontSizeReasonHeading.sp,
);

final fontSmall = TextStyle(
  fontFamily: 'Janna',
  fontWeight: FontWeight.w400,
  color: Colors.black,
  fontSize: Dimensions.fontSizeExtraSmallSamll.sp,
);
final fontSmallwithColor = TextStyle(
  fontFamily: 'Janna',
  fontWeight: FontWeight.w400,
  color: AppColors.defaultAppColor,
  fontSize: Dimensions.fontSizeSmall.sp,
);
final fontSmallBold = TextStyle(
  fontFamily: 'Janna',
  fontWeight: FontWeight.w500,
  color: Colors.black,
  fontSize: 11,
);
final fontRegularPro = TextStyle(
  fontFamily: 'Janna',
  fontWeight: FontWeight.w400,
  color: Colors.black,
  fontSize: Dimensions.fontSizeDefault.sp,
);
final fontRegular = TextStyle(
  fontFamily: 'ArchivoNarrow',
  fontWeight: FontWeight.w400,
  color: Colors.black,
  fontSize: Dimensions.fontSizeLarge.sp,
);
final fontRegularWithColor = TextStyle(
  fontFamily: 'Janna',
  fontWeight: FontWeight.w400,
  color: AppColors.defaultAppColor,
  fontSize: Dimensions.fontSizeSmall.sp,
);
final fontRegularBold = TextStyle(
  fontFamily: 'Janna',
  fontWeight: FontWeight.w700,
  color: Colors.black,
  fontSize: 14.sp,
);
final fontRegularBoldWhite = TextStyle(
  fontFamily: 'Janna',
  fontWeight: FontWeight.w500,
  color: Colors.white,
  fontSize: 14.sp,
);
final fontRegularBoldwithWhiteColor = TextStyle(
  fontFamily: 'Janna',
  fontWeight: FontWeight.w500,
  color: Colors.white,
  fontSize: Dimensions.fontSizeSmall.sp,
);
final fontRegularBoldGreen = TextStyle(
  fontFamily: 'Janna',
  fontWeight: FontWeight.w500,
  color: Colors.green,
  fontSize: Dimensions.fontSizeSmall.sp,
);
final fontRegularBoldwithColor = TextStyle(
  fontFamily: 'Janna',
  fontWeight: FontWeight.w500,
  fontSize: Dimensions.fontSizeSmall.sp,
  color: AppColors.defaultAppColor,
);

final fontMedium = TextStyle(
  fontFamily: 'Janna',
  fontWeight: FontWeight.w500,
  color: Colors.black,
  fontSize: Dimensions.fontSizeLarge.sp,
);
final fontMediumPro = TextStyle(
  fontFamily: 'Janna',
  fontWeight: FontWeight.w600,
  color: Colors.black,
  fontSize: Dimensions.fontSizeDefault.sp,
);

final fontMediumProWhite = TextStyle(
  fontFamily: 'Janna',
  fontWeight: FontWeight.w600,
  color: Colors.white,
  fontSize: Dimensions.fontSizeDefault.sp,
);
final fontSemiBold = TextStyle(
  fontFamily: 'Janna',
  fontWeight: FontWeight.w500,
  color: Colors.black,
  fontSize: 16.sp,
);

final fontBold = TextStyle(
  fontFamily: 'Janna',
  color: Colors.black,
  fontWeight: FontWeight.w600,
  fontSize: Dimensions.fontSizeExtraLarge.sp,
);
final fontBoldWithColor = TextStyle(
    fontFamily: 'Janna',
    fontWeight: FontWeight.w600,
    fontSize: Dimensions.fontSizeExtraLarge.sp,
    color: AppColors.defaultAppColor);

final fontBlack = TextStyle(
  fontFamily: 'Janna',
  fontWeight: FontWeight.w700,
  color: Colors.black,
  fontSize: Dimensions.fontSizeOverLarge.sp,
);
final fontSizeExtraLarge22 = TextStyle(
  fontFamily: 'Janna',
  fontWeight: FontWeight.w500,
  color: Colors.black,
  fontSize: Dimensions.fontSizeExtraLarge22.sp,
);

final fontProfile = TextStyle(
    fontFamily: 'Janna',
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: Colors.black);
