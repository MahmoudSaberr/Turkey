import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pen/Bloc/Cubit/app_cubit.dart';
import 'package:pen/Config/common_components.dart';
import 'package:pen/Theme/text_style.dart';

import '../../../Theme/app_colors.dart';
import '../../../Theme/style.dart';

InkWell profileItem(AppCubit cubit,
    {context, routeName, icon, textValue, onTap}) {
  return InkWell(
    onTap: onTap ??
        () {
          cubit.loadEditPBanner();
          Navigator.pushNamed(context, routeName);
        },
    child: Column(
      children: [
        SizedBox(
          height: 10.h,
        ),
        Row(
          children: [
            SvgPicture.asset(
              icon,
              height: 16.h,
              width: 16.w,
              fit: BoxFit.cover,
              color: AppColors.black,
            ),
            SizedBox(
              width: 16.h,
            ),
            Text(
              textValue,
              style: textStyle(cubit, size: 14.sp),
            ),
          ],
        ),
        SizedBox(
          height: 14.h,
        ),
        myDivider()
      ],
    ),
  );
}
