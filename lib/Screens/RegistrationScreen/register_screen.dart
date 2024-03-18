import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:future_progress_dialog/future_progress_dialog.dart';
import 'package:pen/Theme/text_style.dart';

import '../../Bloc/Cubit/app_cubit.dart';
import '../../Bloc/Cubit/app_states.dart';
import '../../Config/common_components.dart';
import '../../Config/router.dart';
import '../../Models/country_model.dart';
import '../../Theme/app_colors.dart';
import '../../Widgets/button_global.dart';
import '../../Widgets/text_field_widget.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController q1aController = TextEditingController();

  TextEditingController q2aController = TextEditingController();

  List<Country> countries = Country.getCountries();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (BuildContext context, Object? state) {
        if (state is SignUpInitialState) {
          showProgressWithoutMsg(context);
        }
        if (state is SignUpSuccessState) {
          Navigator.pushNamedAndRemoveUntil(
              context, Routes.loginScreen, (Route<dynamic> route) => false);
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
                        height: 20.h,
                      ),
                      Text(
                        'Register now'.tr(),
                        style: textStyle(
                          cubit,
                          fontWeight: FontWeight.w600,
                          size: 24.sp,
                        ),
                      ),
                      Text(
                        'create account'.tr(),
                        style: textStyle(
                          cubit,
                          fontWeight: FontWeight.w600,
                          size: 18.sp,
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      GlobalFormField(
                        controller: nameController,
                        type: TextInputType.name,
                        validate: (value) {
                          if (value.isEmpty) {
                            showToast(
                                msg: 'Enter your full name'.tr(),
                                state: ToastStates.ERROR);
                            return 'please enter your full name'.tr();
                          }
                        },
                        label: 'Name'.tr(),
                        cubit: cubit,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      GlobalFormField(
                        controller: emailController,
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
                        cubit: cubit,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      GlobalFormField(
                        controller: passwordController,
                        cubit: cubit,
                        type: TextInputType.text,
                        suffix: Icon(cubit.icon),
                        onSubmit: (value) {},
                        isPassword: cubit.isPasswordObscure,
                        suffixPressed: () {
                          cubit.changePasswordVisibility();
                        },
                        validate: (value) {
                          if (value.isEmpty) {
                            showToast(
                                msg: 'Enter your password'.tr(),
                                state: ToastStates.ERROR);
                            return 'Please enter your password'.tr();
                          }
                        },
                        label: 'Password'.tr(),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      GlobalFormField(
                        controller: confirmPasswordController,
                        cubit: cubit,
                        type: TextInputType.text,
                        suffix: Icon(cubit.confirmIcon),
                        onSubmit: (value) {},
                        isPassword: cubit.isConfirmPasswordObscure,
                        suffixPressed: () {
                          cubit.changeConfirmPasswordVisibility();
                        },
                        validate: (value) {
                          if (value.isEmpty &&
                              value.toString() != passwordController.text) {
                            showToast(
                                msg: 'not correct password'.tr(),
                                state: ToastStates.ERROR);
                            return 'not correct password'.tr();
                          }
                        },
                        label: 'Confirm Password'.tr(),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      GlobalFormField(
                        controller: phoneController,
                        cubit: cubit,
                        type: TextInputType.phone,
                        validate: (value) {
                          if (value.isEmpty) {
                            showToast(
                                msg: 'enter your phone number'.tr(),
                                state: ToastStates.ERROR);
                            return 'please enter your phone number'.tr();
                          }
                        },
                        label: 'Phone Number'.tr(),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      GlobalFormField(
                        controller: q1aController,
                        cubit: cubit,
                        type: TextInputType.text,
                        validate: (value) {
                          if (value.isEmpty) {
                            showToast(
                                msg: 'enter your phone number'.tr(),
                                state: ToastStates.ERROR);
                            return 'please enter your phone number'.tr();
                          }
                        },
                        label: 'Favorite Hobby'.tr(),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      GlobalFormField(
                        controller: q2aController,
                        cubit: cubit,
                        type: TextInputType.text,
                        validate: (value) {
                          if (value.isEmpty) {
                            showToast(
                                msg: 'enter your phone number'.tr(),
                                state: ToastStates.ERROR);
                            return 'please enter your phone number'.tr();
                          }
                        },
                        label: 'Favorite Teacher'.tr(),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Container(
                        height: 43.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.kBgColor,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: AppColors.defaultAppColor,
                            width: 2.0,
                          ),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<Country>(
                            hint: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                cubit.isCountryChanged
                                    ? cubit.country!.name
                                    : "Country",
                                style: textStyle(
                                  cubit,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            icon: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.arrow_drop_down,
                              ),
                            ),
                            iconSize: 22,
                            dropdownColor: Colors.white,
                            items: cubit.buildDropdownMenuItemsFrom(countries),
                            onChanged: (value) {
                              cubit.onChangeDropdownItemFrom(value);
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Text(
                        'Are you a college student?'.tr(),
                        style: textStyle(
                          cubit,
                          fontWeight: FontWeight.w600,
                          size: 16.sp,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: RadioListTile(
                              value: true,
                              title: Text(
                                'yes'.tr(),
                                style: textStyle(cubit, size: 16.sp),
                              ),
                              groupValue: cubit.isStudent,
                              onChanged: (value) {
                                cubit.handleGenderChange(value!);
                              },
                            ),
                          ),
                          Expanded(
                            child: RadioListTile(
                              title: Text(
                                'no'.tr(),
                                style: textStyle(cubit, size: 16.sp),
                              ),
                              value: false,
                              groupValue: cubit.isStudent,
                              onChanged: (value) {
                                cubit.handleGenderChange(value!);
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      (state is SignUpInitialState)
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: AppColors.defaultAppColor,
                              ),
                            )
                          : ButtonGlobal(
                              padding: 0,
                              buttonDecoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  color: AppColors.amber500),
                              onPressed: () async {
                                if (formKey.currentState!.validate() &&
                                    cubit.country != null) {
                                  await cubit.createEmail(
                                    email: emailController.text.trim(),
                                    password: passwordController.text.trim(),
                                    name: nameController.text.trim(),
                                    phone: phoneController.text.trim(),
                                    secQ1A: q1aController.text.trim(),
                                    secQ2A: q2aController.text.trim(),
                                  );
                                  cubit.loadBanner();
                                }
                              },
                              buttontext: "Sign Up".tr(),
                            ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Container(
                        height: 50,
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
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
