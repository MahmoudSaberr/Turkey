import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Bloc/Cubit/app_cubit.dart';
import '../../Bloc/Cubit/app_states.dart';
import '../../Config/common_components.dart';
import '../../Config/images.dart';
import '../../Theme/app_colors.dart';
import '../../Theme/text_style.dart';
import '../../Widgets/button_global.dart';
import '../../Widgets/text_field_widget.dart';

class UpdatePassScreen extends StatefulWidget {
  const UpdatePassScreen({Key? key}) : super(key: key);

  @override
  State<UpdatePassScreen> createState() => _UpdatePassScreenState();
}

class _UpdatePassScreenState extends State<UpdatePassScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController newPassController = TextEditingController();

  TextEditingController confirmNewPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Update Password'.tr(),
              style: textStyle(
                cubit,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
            backgroundColor: AppColors.white,
            elevation: 0,
          ),
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
                          Images.password,
                          width: 200.w,
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      GlobalFormField(
                        controller: newPassController,
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
                        controller: confirmNewPassController,
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
                              value.toString() != newPassController.text) {
                            showToast(
                                msg: 'not correct password'.tr(),
                                state: ToastStates.ERROR);
                            return 'not correct password'.tr();
                          }
                        },
                        label: 'Confirm Password'.tr(),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      (state is ResetInitialState)
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: AppColors.defaultAppColor,
                              ),
                            )
                          : ButtonGlobal(
                              onPressed: () {
                                if (formKey.currentState!.validate() &&
                                    newPassController.text.trim() ==
                                        confirmNewPassController.text.trim()) {
                                  cubit.resetPassword(
                                      email: cubit.resetEmail,
                                      newPassword:
                                          newPassController.text.trim(),
                                      context: context);
                                } else {
                                  showToast(
                                      msg: 'Enter your password'.tr(),
                                      state: ToastStates.ERROR);
                                }
                              },
                              buttontext: "Update".tr(),
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
