import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pen/Screens/UpdatePassScreen/update_pass_screen.dart';

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
class IdentityScreen extends StatelessWidget {
  IdentityScreen({Key? key}) : super(key: key);
  var formKey = GlobalKey<FormState>();
  TextEditingController q1aController = TextEditingController();

  TextEditingController q2aController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Confirm Identity'.tr(),
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
                        height: 10.h,
                      ),
                      Center(
                        child: Image.asset(
                          Images.identity,
                          width: 200.w,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        'These questions have already been answered while creating your account, so you must verify their answers to confirm your identity'
                            .tr(),
                        style: fontRegular.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      GlobalFormField(
                        controller: q1aController,
                        cubit: cubit,
                        type: TextInputType.text,
                        validate: (value) {
                          if (value.isEmpty) {
                            showToast(
                                msg: 'please enter your answer'.tr(),
                                state: ToastStates.ERROR);
                            return 'please enter your answer'.tr();
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
                                msg: 'please enter your answer'.tr(),
                                state: ToastStates.ERROR);
                            return 'please enter your answer'.tr();
                          }
                        },
                        label: 'Favorite Teacher'.tr(),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      (state is ResetInitialState)
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: AppColors.defaultAppColor,
                              ),
                            )
                          : ButtonGlobal(
                              onPressed: () {
                                if (cubit.userModel != null) {
                                  if (cubit.userModel!.secQ1A ==
                                          q1aController.text.trim() &&
                                      cubit.userModel!.secQ2A ==
                                          q2aController.text.trim()) {
                                    Navigator.pushReplacementNamed(
                                      context,
                                      Routes.updatePassScreen,
                                    );
                                  } else {
                                    showToast(
                                        msg: 'The answers are incorrect'.tr(),
                                        state: ToastStates.ERROR);
                                  }
                                } else {
                                  if (cubit.securityModel!.answer_1 ==
                                          q1aController.text.trim() &&
                                      cubit.securityModel!.answer_2 ==
                                          q2aController.text.trim()) {
                                    Navigator.pushReplacementNamed(
                                      context,
                                      Routes.updatePassScreen,
                                    );
                                  } else {
                                    showToast(
                                        msg: 'The answers are incorrect'.tr(),
                                        state: ToastStates.ERROR);
                                  }
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
          ),
        );
      },
    );
  }
}
