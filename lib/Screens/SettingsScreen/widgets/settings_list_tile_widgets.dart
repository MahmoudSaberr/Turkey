import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pen/Bloc/Cubit/app_cubit.dart';
import 'package:pen/Theme/app_colors.dart';
import 'package:pen/Theme/text_style.dart';

class SettingsListTile extends StatelessWidget {
  final IconData? leadingIcon;
  final AppCubit cubit;
  final String? title;
  final VoidCallback? press;

  const SettingsListTile(
  {super.key, this.leadingIcon, this.title, this.press, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: ListTile(
        tileColor: AppColors.white,
        onTap: press!,
        leading: Icon(
          leadingIcon,
          color: AppColors.defaultAppColor,
        ),
        title: Text(
          title!,
          style: textStyle(cubit, size: 16.sp, fontWeight: FontWeight.w600),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: AppColors.defaultAppColor,
        ),
      ),
    );
  }
}
