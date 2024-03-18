import 'package:flutter/material.dart';
import 'package:pen/Bloc/Cubit/app_cubit.dart';
import 'package:pen/Theme/text_style.dart';

class PaymentItemInfo extends StatelessWidget {
  const PaymentItemInfo({super.key, required this.title, required this.value});
  final String title, value;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: textStyle(AppCubit.get(context)),
        ),
        Text(
          value,
          style: textStyle(AppCubit.get(context),fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}