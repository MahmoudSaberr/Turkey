import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:future_progress_dialog/future_progress_dialog.dart';

import '../../Bloc/Cubit/app_cubit.dart';
import '../../Bloc/Cubit/app_states.dart';
import '../../Config/common_components.dart';
import '../../Config/images.dart';
import '../../Config/router.dart';
import '../../Theme/app_colors.dart';
import '../../Theme/style.dart';
import '../../Theme/text_style.dart';
import '../../Widgets/button_global.dart';
import '../../Widgets/text_field_widget.dart';

// ignore: must_be_immutable
class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future getFuture() {
    return Future(() async {
      await Future.delayed(const Duration(seconds: 3));
      return 'Hello, Future Progress Dialog!';
    });
  }

  Future<void> showProgressWithoutMsg(BuildContext context) async {
    await showDialog(
        context: context,
        builder: (context) => FutureProgressDialog(
              getFuture(),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (BuildContext context, Object? state) {
        if (state is LogInSuccessState) {
          Navigator.pushNamedAndRemoveUntil(
              context, Routes.homeScreen, (Route<dynamic> route) => false);
        }

        if (state is LogInInitialState) {
          showProgressWithoutMsg(context);
        }

        if (state is LogInErrorState) {
          showToast(
            msg: state.error,
            state: ToastStates.ERROR,
          );
        }
      },
      builder: (BuildContext context, state) {
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
                        height: 10.h,
                      ),
                      Text(
                        'Welcome'.tr(),
                        style: textStyle(
                          cubit,
                          fontWeight: FontWeight.w600,
                          size: 24.sp,
                        ),
                      ),
                      Text(
                        'To continue, login'.tr(),
                        style: textStyle(cubit, size: 18.sp),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      GlobalFormField(
                        controller: emailController,
                        type: TextInputType.emailAddress,
                        validate: (value) {
                          if (value.isEmpty) {
                            showToast(
                                msg: 'Email Empty'.tr(),
                                state: ToastStates.ERROR);
                            return 'Please enter your email'.tr();
                          }
                        },
                        label: 'E-mail'.tr(),
                        cubit: cubit,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      GlobalFormField(
                        controller: passwordController,
                        type: TextInputType.visiblePassword,
                        suffix: Icon(cubit.loginIcon),
                        onSubmit: (value) {},
                        isPassword: cubit.isLoginPasswordObscure,
                        suffixPressed: () {
                          cubit.changeLoginPasswordVisibility();
                        },
                        validate: (value) {
                          if (value.isEmpty) {
                            showToast(
                                msg: 'Password Empty'.tr(),
                                state: ToastStates.ERROR);
                            return 'please enter your password'.tr();
                          }
                        },
                        label: 'Password'.tr(),
                        cubit: cubit,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: defaultTextButton(
                          function: () {
                            Navigator.pushNamed(
                                context, Routes.forgotPassScreen);
                          },
                          text: 'Forgot Password?'.tr(),
                          style: fontRegular.copyWith(
                            decoration: TextDecoration.underline,
                            color: AppColors.defaultAppColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      state is LogInInitialState
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: AppColors.defaultAppColor,
                              ),
                            )
                          : ButtonGlobal(
                              padding: 0,
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  await cubit.loginWithEmailAndPassword(
                                    email: emailController.text,
                                    pass: passwordController.text,
                                  );
                                  cubit.loadBanner();
                                  showToast(
                                      msg: 'Welcome'.tr(),
                                      state: ToastStates.SUCCESS);
                                }
                              },
                              buttontext: "Login".tr(),
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
              onTap: (() =>
                  Navigator.pushNamed(context, Routes.registerScreen)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Sign Up'.tr(),
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
