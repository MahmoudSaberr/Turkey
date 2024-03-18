import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdMobServices {
  static AppOpenAd? appOpenAd;

  //فتح التطبيق
  static void appOpenAdManager(){
    AppOpenAd.load(
      adUnitId: 'ca-app-pub-3940256099942544/9257395921',
      orientation: AppOpenAd.orientationPortrait,
      request: const AdRequest(),
      adLoadCallback: AppOpenAdLoadCallback(
        onAdLoaded: (ad) {
          appOpenAd = ad;
          appOpenAd!.show();
        },
        onAdFailedToLoad: (error) {
          debugPrint('AppOpenAd failed to load: $error');
          // Handle the error.
        },
      ),
    );
  }
  bool get isAdAvailable {
    return appOpenAd != null;
  }

  //بانر
  static BannerAd getBannerAds() {
    return BannerAd(
      size: AdSize.largeBanner,
      adUnitId: "ca-app-pub-3940256099942544/6300978111",
      listener: BannerAdListener(
        onAdOpened: (ad) => debugPrint('Ad opened'),
        onAdClosed: (ad) => debugPrint('Ad closed'),
        onAdLoaded: (ad) => debugPrint('Ad Loaded'),
        onAdFailedToLoad: (ad, error) {
          debugPrint("failed To Load Banner ${error.message}");
          ad.dispose();
        },
      ),
      request: const AdRequest(),
    );
  }
  static Widget showBannerAds(BannerAd myBanner) {
    myBanner.load();
    return Container(
        margin: EdgeInsets.only(bottom: 12.h),
        height: 52.h,
        child: AdWidget(ad: myBanner));
  }

  //بيني
  static void createInterstitialAd(InterstitialAd? interstitialAd) async {
    await InterstitialAd.load(
      adUnitId: "ca-app-pub-3940256099942544/1033173712",
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          debugPrint("Loaded InterstitialAd");
          interstitialAd = ad;
          if (interstitialAd == null) {
            return;
          } else {
            interstitialAd!.fullScreenContentCallback =
                FullScreenContentCallback(onAdShowedFullScreenContent: (ad) {
              debugPrint("Ad Showed on Full Screen");
            }, onAdDismissedFullScreenContent: (ad) {
              debugPrint("ad InterstitialAd disposed");
              ad.dispose();
            }, onAdFailedToShowFullScreenContent: (ad, error) {
              debugPrint("on ad failed to show full screen content");
              ad.dispose();
            }, onAdWillDismissFullScreenContent: (ad) {
              debugPrint("ad will dismiss full screen content");
            });
            interstitialAd!.show();
          }
        },
        onAdFailedToLoad: (error) {
          debugPrint("InterstitialAd add error is =>$error");
          interstitialAd = null;
        },
      ),
      request: const AdRequest(),
    );
  }

  //مدمج
  static NativeAd loadNNativeAd() {
    return NativeAd(
        adUnitId: 'ca-app-pub-9934588186123542/1757887575',
        listener: NativeAdListener(
          onAdLoaded: (ad) {
            debugPrint('$NativeAd loaded.');
          },
          onAdFailedToLoad: (ad, error) {
            debugPrint('$NativeAd failed to load: $error');
            ad.dispose();
          },
        ),
        request: const AdRequest(),
        // Styling
        nativeTemplateStyle: NativeTemplateStyle(
          // Required: Choose a template.
            templateType: TemplateType.medium,
            // Optional: Customize the ad's style.
            mainBackgroundColor: Colors.purple,
            cornerRadius: 10.0,
            callToActionTextStyle: NativeTemplateTextStyle(
                textColor: Colors.cyan,
                backgroundColor: Colors.red,
                style: NativeTemplateFontStyle.monospace,
                size: 16.0),
            primaryTextStyle: NativeTemplateTextStyle(
                textColor: Colors.red,
                backgroundColor: Colors.cyan,
                style: NativeTemplateFontStyle.italic,
                size: 16.0),
            secondaryTextStyle: NativeTemplateTextStyle(
                textColor: Colors.green,
                backgroundColor: Colors.black,
                style: NativeTemplateFontStyle.bold,
                size: 16.0),
            tertiaryTextStyle: NativeTemplateTextStyle(
                textColor: Colors.brown,
                backgroundColor: Colors.amber,
                style: NativeTemplateFontStyle.normal,
                size: 16.0)))
      ..load();
  }

  /*
  *   BannerAd? _myBanner;

  @override
  void initState() {
      AdMobServices.appOpenAdManager();

    if (Platform.isAndroid) {
      _myBanner = AdMobServices.getBannerAds();
      _myBanner?.load();
    }

    super.initState();
  }

  @override
  void dispose() {
    if (Platform.isAndroid) {
      _myBanner?.dispose();
    }
    super.dispose();
  }
  *
  * AdMobServices.showBannerAds(_myBanner!)
  *
  *
  *
  *
  *
  *
  *
  *  InterstitialAd? _interstitialAd;

  *                                   AdMobServices.createInterstitialAd(
                                      _interstitialAd);

*/

}
