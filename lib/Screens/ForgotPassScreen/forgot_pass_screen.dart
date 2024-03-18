import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pen/Screens/IdentityScreen/identity_screen.dart';

import '../../Bloc/Cubit/app_cubit.dart';
import '../../Bloc/Cubit/app_states.dart';
import '../../Config/common_components.dart';
import '../../Config/images.dart';
import '../../Theme/app_colors.dart';
import '../../Theme/style.dart';
import '../../Theme/text_style.dart';
import '../../Widgets/button_global.dart';
import '../../Widgets/text_field_widget.dart';

// ignore: must_be_immutable
class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();

    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);

        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30.h,
                      ),
                      Center(
                        child: Image.asset(
                          Images.splashIcon,
                          width: 200.w,
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Text(
                        'Forgot Password'.tr(),
                        style: fontRegular.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        'Enter your email to verify identity'.tr(),
                        style: fontRegular.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      GlobalFormField(
                        controller: emailController,
                        cubit: cubit,
                        type: TextInputType.emailAddress,
                        validate: (value) {
                          if (value.isEmpty) {
                            showToast(
                                msg: 'please enter your email'.tr(),
                                state: ToastStates.ERROR);
                            return 'please enter your email'.tr();
                          }
                        },
                        label: 'E-mail'.tr(),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      (state is GetVerificationAnswersLoadingState)
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: AppColors.defaultAppColor,
                              ),
                            )
                          : ButtonGlobal(
                              onPressed: () async {
                                if (emailController.text.isEmpty ||
                                    emailController.text.trim() == '') {
                                  showToast(
                                      msg: 'please enter your email'.tr(),
                                      state: ToastStates.ERROR);
                                } else {
                                  cubit.resetEmail =
                                      emailController.text.trim();
                                  await cubit.getVerificationAnswers(
                                      email: emailController.text.trim(),
                                      context: context);
                                }
                              },
                              buttontext: "Next".tr(),
                              buttonDecoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  color: AppColors.amber500),
                            ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          bottomNavigationBar: Container(
            height: 100,
            alignment: Alignment.center,
            child: InkWell(
              onTap: (() => Navigator.pop(context)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Login'.tr(),
                    style: textStyle(
                      cubit,
                      size: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  const Icon(
                    Icons.arrow_forward,
                    color: AppColors.defaultAppColor,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
