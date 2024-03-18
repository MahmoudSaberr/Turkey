import 'package:flutter/material.dart';

import '../../../Bloc/Cubit/app_cubit.dart';
import '../../../Theme/text_style.dart';

class TotalPrice extends StatelessWidget {
  const TotalPrice({super.key, required this.title, required this.value});

  final String title, value;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: textStyle(AppCubit.get(context),fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        Text(
          value,
          textAlign: TextAlign.center,
          style: textStyle(AppCubit.get(context),fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}