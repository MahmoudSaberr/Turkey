import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pen/Config/cache_helper.dart';

import '../../Bloc/Cubit/app_cubit.dart';
import '../../Bloc/Cubit/app_states.dart';
import '../../Config/ad_mob_services.dart';
import '../../Config/common_components.dart';
import '../../Config/images.dart';
import '../../Config/my_fade_in.dart';
import '../../Config/router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<AppCubit>(context)..splashTimer(),
      child: BlocListener<AppCubit, AppStates>(
        listener: (context, state) {
          if (state is SplashscreenLoading) {
            if (CacheHelper.userType != 'Active') {
              AdMobServices.appOpenAdManager();
            }
            CacheHelper.isLogged == true
                ? Navigator.pushReplacementNamed(context, Routes.homeScreen)
                : Navigator.pushReplacementNamed(context, Routes.loginScreen);
          } else {
            print(state);
          }
        },
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(45.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MyFadeIn(
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(
                          width: 300.w,
                          child: Image(
                            image: AssetImage(
                              Images.splashIcon,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
