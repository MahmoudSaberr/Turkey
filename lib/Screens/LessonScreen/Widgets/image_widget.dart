import 'package:flutter/material.dart';
import 'package:pen/Bloc/Cubit/app_cubit.dart';
import 'package:pen/Config/images.dart';
import 'package:pen/Screens/LessonScreen/Widgets/custom_clipper_shape.dart';

import '../../../Config/ad_mob_services.dart';
import '../../../Config/cache_helper.dart';
import '../../../Config/router.dart';

class ImageWithPlayButton extends StatelessWidget {
  final AppCubit cubit;

  const ImageWithPlayButton({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipPath(
            clipper: CustomClipperShape(),
            child: Image.asset(
              Images.videoPlayImage,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            if (CacheHelper.userType != 'Active') {
              AdMobServices.createInterstitialAd(cubit.interstitialAd);
            }
            cubit.videoLink = cubit.lessonModel!.videoUrl;
            Navigator.pushNamed(context, Routes.videoScreen);
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.transparent,
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(16),
          ),
          child: const Icon(Icons.play_arrow),
        ),
      ],
    );
  }
}
