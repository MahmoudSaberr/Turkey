import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pen/Bloc/Cubit/app_cubit.dart';
import 'package:pen/Theme/app_colors.dart';
import 'package:pen/Theme/text_style.dart';

import '../../theme/style.dart';

class GlobalFormField extends StatefulWidget {
  final dynamic controller;
  final TextInputType type;
  final dynamic initial;
  final dynamic onSubmit;
  final dynamic onChange;
  final dynamic onTap;
  final dynamic validate;
  final bool isPassword;
  final bool readOnly;
  final String label;
  final String? hintText;
  final dynamic suffix;
  final dynamic prefixIcon;
  final dynamic cubit;
  final Function? suffixPressed;
  final bool isClickable;

  const GlobalFormField(
      {Key? key,
      this.controller,
      required this.type,
      this.initial,
      this.onSubmit,
      this.onChange,
      this.onTap,
      this.isPassword = false,
      this.readOnly = false,
      required this.validate,
      required this.label,
      this.hintText,
      this.suffix,
      required this.cubit,
      this.prefixIcon,
      this.suffixPressed,
      this.isClickable = true})
      : super(key: key);

  @override
  _GlobalFormFieldState createState() => _GlobalFormFieldState();
}

class _GlobalFormFieldState extends State<GlobalFormField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
/*        Text(
          widget.label,
          style: fontRegular.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.black,
          ),
        ),
        SizedBox(
          height: 4.h,
        ),*/
        TextFormField(
          initialValue: widget.initial,
          controller: widget.controller,
          cursorColor: AppColors.thirdAppColor,
          keyboardType: widget.type,
          obscureText: widget.isPassword,
          readOnly: widget.readOnly,
          enabled: widget.isClickable,
          onFieldSubmitted: widget.onSubmit,
          onChanged: widget.onChange,
          onTap: widget.onTap,
          validator: widget.validate,
          style: textStyle(AppCubit.get(context),
              size: Dimensions.fontSizeDefault.sp),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10),
            labelText: widget.label,
            labelStyle: textStyle(AppCubit.get(context)),
            fillColor: AppColors.kBgColor,
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  color: AppColors.thirdAppColor,
                  width: 2.0),
              borderRadius: BorderRadius.circular(10.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                color: AppColors.defaultAppColor,
                width: 2.0,
              ),
            ),
            hintText: widget.hintText,
            hintStyle: fontRegular.copyWith(color: AppColors.greyColor),
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.suffix != null
                ? IconButton(
                    highlightColor: AppColors.defaultAppColor,
                    focusColor: AppColors.secondaryAppColor,
                    onPressed: () {
                      widget.suffixPressed!();
                    },
                    icon: widget.suffix,
                  )
                : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}
