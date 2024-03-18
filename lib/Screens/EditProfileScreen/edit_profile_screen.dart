import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pen/Config/cache_helper.dart';

import '../../Bloc/Cubit/app_cubit.dart';
import '../../Bloc/Cubit/app_states.dart';
import '../../Config/ad_mob_services.dart';
import '../../Config/common_components.dart';
import '../../Theme/app_colors.dart';
import '../../Theme/text_style.dart';
import '../../Widgets/button_global.dart';
import '../../Widgets/text_field_widget.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var nameController = TextEditingController(text: CacheHelper.name);
    var phoneController = TextEditingController(text: CacheHelper.phone);

    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: Text(
              'Edit Profile'.tr(),
              style: textStyle(
                cubit,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: SafeArea(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 55,
                    ),
                    Padding(
                      padding: EdgeInsets.all(20.w),
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GlobalFormField(
                              controller: nameController,
                              cubit: cubit,
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
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            GlobalFormField(
                              controller: phoneController,
                              cubit: cubit,
                              type: TextInputType.emailAddress,
                              validate: (value) {
                                if (value.isEmpty) {
                                  showToast(
                                      msg: 'ادخل رقم الهاتف',
                                      state: ToastStates.ERROR);

                                  return 'يرجى إدخال رقم الهاتف';
                                }
                              },
                              label: 'الهاتف',
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            (state is UpdateUserLoadingState)
                                ? const Center(
                                    child: CircularProgressIndicator(
                                      color: AppColors.defaultAppColor,
                                    ),
                                  )
                                : ButtonGlobal(
                                    onPressed: () async {
                                      if (CacheHelper.name !=
                                              nameController.text.trim() ||
                                          CacheHelper.phone !=
                                              phoneController.text.trim()) {
                                        await cubit.updateUserData(
                                            phone: phoneController.text.trim(),
                                            fullName:
                                                nameController.text.trim(),
                                            context: context);
                                      } else {
                                        showToast(
                                            msg: 'There is no change in data'
                                                .tr(),
                                            state: ToastStates.ERROR);
                                      }
                                    },
                                    buttontext: "OK".tr(),
                                    buttonDecoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                        color: AppColors.amber500),
                                  ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: CacheHelper.userType != 'Active'
              ? AdMobServices.showBannerAds(cubit.eProfileBanner!)
              : const SizedBox(),
        );
      },
    );
  }
}
