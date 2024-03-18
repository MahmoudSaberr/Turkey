import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pen/Theme/text_style.dart';

import '../Bloc/Cubit/app_cubit.dart';
import '../Theme/app_colors.dart';

class BuildRowItem extends StatelessWidget {
  AppCubit cubit;
  IconData iconData;
  String text;
  bool arrowStatus;

  BuildRowItem({
    super.key,
    required this.cubit,
    required this.iconData,
    required this.text,
    required this.arrowStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
      const EdgeInsets.symmetric(horizontal: 14.0),
      height: 40.h,
      color: AppColors.white ,
      child: Row(
        children: [
          SizedBox(width: 4.w,),
          Icon(
            iconData,
            color: AppColors.defaultAppColor,
          ),
          SizedBox(width: 30.0.w),
          Text(
            text,
            style: textStyle(
              cubit,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(),
          Icon(
            arrowStatus ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
            color: AppColors.defaultAppColor,

          ),
        ],
      ),
    );
  }
}
