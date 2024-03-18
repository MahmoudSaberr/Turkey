import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pen/Bloc/Cubit/app_cubit.dart';
import 'package:pen/Bloc/Cubit/app_states.dart';
import 'package:pen/Config/images.dart';
import 'package:pen/Config/router.dart';
import 'package:pen/Screens/PaymentScreens/Widgets/toggle_card_widget.dart';
import 'package:pen/Widgets/text_field_widget.dart';

import '../../Config/common_components.dart';
import '../../Config/constants.dart';
import '../../Theme/app_colors.dart';
import '../../Theme/text_style.dart';

class ToggleScreen extends StatelessWidget {
  const ToggleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var phoneController = TextEditingController();
    var formKey = GlobalKey<FormState>();

    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if (state is PaymentRequestTokenCardSuccessState) {
          Navigator.pushReplacementNamed(context, Routes.visaScreen);
        }
        if (state is PaymentRequestWalletSuccessState) {
          Navigator.pushReplacementNamed(context, Routes.walletScreen);
        }
      },
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Premium'.tr(),
              style: textStyle(
                cubit,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
            backgroundColor: AppColors.white,
            elevation: 0,
          ),
          body: SingleChildScrollView(
            child: Stack(
              children: [
                (state is PaymentRequestTokenCardLoadingState ||
                        state is PaymentRequestWalletLoadingState ||
                        state is PaymentRequestTokenCardForWalletSuccessState ||
                        state is PaymentRequestTokenCardSuccessState ||
                        state is PaymentRequestWalletLoadingState)
                    ? const Positioned(
                        top: 0,
                        right: 0,
                        left: 0,
                        child: LinearProgressIndicator(
                          color: AppColors.thirdAppColor,
                        ),
                      )
                    : const SizedBox(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 20),
                      child: InkWell(
                        onTap: () async {
                          await cubit.getFinalTokenCard();
                        },
                        child: ToggleCard(
                          name: 'Card Payments',
                          imageUrl: Images.cardIcon,
                          cubit: cubit,
                        ),
                      ),
                    ),
                    Form(
                      key: formKey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 20),
                        child: InkWell(
                          onTap: () async {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(
                                    'Enter Wallet Mobile Number'.tr(),
                                    style: textStyle(
                                      cubit,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      GlobalFormField(
                                        controller: phoneController,
                                        cubit: cubit,
                                        type: TextInputType.phone,
                                        validate: (value) {
                                          if (value.isEmpty) {
                                            showToast(
                                                msg: 'enter your phone number'
                                                    .tr(),
                                                state: ToastStates.ERROR);
                                            return 'please enter your phone number'
                                                .tr();
                                          }
                                        },
                                        label: 'Phone Number'.tr(),
                                      ),
                                    ],
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text(
                                        'Cancel'.tr(),
                                        style: textStyle(cubit),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () async {
                                        if (formKey.currentState!.validate()) {
                                          Navigator.of(context).pop();
                                          await cubit
                                              .getFinalTokenCardForWallet(
                                            phoneController.text.trim(),
                                          );
                                        }
                                      },
                                      child: Text(
                                        'OK'.tr(),
                                        style: textStyle(cubit),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: ToggleCard(
                            name: 'Mobile Wallets',
                            imageUrl: Images.mobileWallet,
                            cubit: cubit,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
