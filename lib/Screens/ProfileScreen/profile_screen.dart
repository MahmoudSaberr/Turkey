import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pen/Config/cache_helper.dart';
import 'package:pen/Screens/ProfileScreen/widgets/profile_item.dart';

import '../../Bloc/Cubit/app_cubit.dart';
import '../../Bloc/Cubit/app_states.dart';
import '../../Config/ad_mob_services.dart';
import '../../Config/common_components.dart';
import '../../Config/images.dart';
import '../../Config/router.dart';
import '../../Theme/app_colors.dart';
import '../../Theme/style.dart';
import '../../Theme/text_style.dart';
import '../../Widgets/dialog_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Profile'.tr(),
              style: textStyle(
                cubit,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
            elevation: 0,
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 20.0.h),
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: 10.w, right: 10.w, bottom: 10.h),
                          child: SingleChildScrollView(
                            child: SizedBox(
                              child: Column(
                                children: [
                                  //first box
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color:
                                              AppColors.gray2.withOpacity(0.5)),
                                      borderRadius: BorderRadius.circular(30),
                                      color: AppColors.white,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Icon(
                                                CupertinoIcons.person,
                                                color: AppColors.black,
                                                size: 20.w,
                                              ),
                                              SizedBox(
                                                width: 20.w,
                                              ),
                                              Text(
                                                CacheHelper.name,
                                                style: textStyle(cubit,
                                                    size: Dimensions
                                                        .fontSizeLarge.sp,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 8.h),
                                            child: myDivider(),
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                CupertinoIcons.mail,
                                                color: AppColors.black,
                                                size: 20.w,
                                              ),
                                              SizedBox(
                                                width: 20.w,
                                              ),
                                              Text(
                                                CacheHelper.email,
                                                style: textStyle(cubit,
                                                    size: Dimensions
                                                        .fontSizeLarge.sp,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 8.h),
                                            child: myDivider(),
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                CupertinoIcons.phone,
                                                color: AppColors.black,
                                                size: 20.w,
                                              ),
                                              SizedBox(
                                                width: 20.w,
                                              ),
                                              Text(
                                                CacheHelper.phone,
                                                style: textStyle(cubit,
                                                    size: Dimensions
                                                        .fontSizeLarge.sp,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 8.h),
                                            child: myDivider(),
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                CupertinoIcons.map,
                                                color: AppColors.black,
                                                size: 20.w,
                                              ),
                                              SizedBox(
                                                width: 20.w,
                                              ),
                                              Text(
                                                CacheHelper.country,
                                                style: textStyle(cubit,
                                                    size: Dimensions
                                                        .fontSizeLarge.sp,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30.h,
                                  ),
                                  //second box
                                  Container(
                                    padding: const EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color:
                                              AppColors.gray2.withOpacity(0.5)),
                                      borderRadius: BorderRadius.circular(30),
                                      color: AppColors.white,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        profileItem(
                                          cubit,
                                          context: context,
                                          routeName: Routes.editProfileScreen,
                                          icon: Images.iconEditProfile,
                                          textValue: "Edit Profile".tr(),
                                        ),
                                        SizedBox(
                                          height: 14.h,
                                        ),
                                        profileItem(
                                          cubit,
                                          context: context,
                                          routeName: Routes.identityScreen,
                                          icon: Images.iconEditProfile,
                                          textValue: "Update Password".tr(),
                                        ),
                                        SizedBox(
                                          height: 14.h,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            ShowDialogg(
                                              context: context,
                                              title: "Sign Out".tr(),
                                              description:
                                                  "Are your sure you want to sign out?"
                                                      .tr(),
                                              sharedKey: "isTrans",
                                              okBut: false,
                                              okString: "yes".tr(),
                                              canString: 'no'.tr(),
                                              canButton: () =>
                                                  Navigator.pop(context),
                                              okButton: () {
                                                cubit.bottomNavIndex = 0;

                                                CacheHelper.clear();
                                                Navigator
                                                    .pushNamedAndRemoveUntil(
                                                        context,
                                                        Routes.loginScreen,
                                                        (route) => false);
                                              },
                                            );
                                          },
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  SvgPicture.asset(
                                                    Images.iconLogout,
                                                    height: 16.h,
                                                    width: 16.w,
                                                    fit: BoxFit.cover,
                                                    color: AppColors.black,
                                                  ),
                                                  SizedBox(
                                                    width: 16.h,
                                                  ),
                                                  Text(
                                                    "Sign Out".tr(),
                                                    style: textStyle(cubit,
                                                        size: 14.sp),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 14.h,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30.h,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: CacheHelper.userType != 'Active'
              ? AdMobServices.showBannerAds(cubit.profileBanner!)
              : const SizedBox(),
        );
      },
    );
  }
}
