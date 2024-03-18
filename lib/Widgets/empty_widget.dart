import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:pen/Theme/text_style.dart';

Center emptyWidget(title, cubit, {String? gif}) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Lottie.asset(gif ?? 'assets/gifs/empty.json',
            width: 300,
            height: 200,
            alignment: Alignment.center,
            fit: BoxFit.fill),
        SizedBox(
          height: 10.h,
        ),
        Text(
          title + ' !!',
          style: textStyle(
            cubit,
            fontWeight: FontWeight.bold,
            size: 18.0,
          ),
        ),
      ],
    ),
  );
}
