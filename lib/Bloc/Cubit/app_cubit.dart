import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:pen/Models/lesson_model.dart';
import 'package:pen/Models/level_model.dart';
import 'package:pen/Models/payment_model.dart';
import 'package:pen/Models/rules_model.dart';
import 'package:pen/Models/security_model.dart';
import 'package:pen/Screens/LevelsScreen/levels_screen.dart';
import 'package:pen/Screens/RulesScreen/rules_screen.dart';
import 'package:pen/Theme/text_style.dart';
import 'package:encrypt/encrypt.dart' as encrypt;

import '../../Config/ad_mob_services.dart';
import '../../Config/cache_helper.dart';
import '../../Config/common_components.dart';
import '../../Config/constants.dart';
import '../../Config/dio_helper.dart';
import '../../Config/dio_helper_payment.dart';
import '../../Config/router.dart';
import '../../Models/country_model.dart';
import '../../Models/first_token.dart';
import '../../Models/user_model.dart';
import 'app_states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  BannerAd? bannerAd,
      lessonsBanner,
      rulesBanner,
      levelsBanner,
      lessonBanner,
      settingsBanner,
      profileBanner,
      eProfileBanner,
      sentencesBanner;

  void loadBanner() {
    bannerAd = AdMobServices.getBannerAds();
    bannerAd?.load();
    emit(LoadBannerState());
  }

  void loadRulesBanner() {
    rulesBanner = AdMobServices.getBannerAds();
    rulesBanner?.load();
    emit(LoadBannerState());
  }
  void loadLevelsBanner() {
    levelsBanner = AdMobServices.getBannerAds();
    levelsBanner?.load();
    emit(LoadBannerState());
  }

  void loadLessonsBanner() {
    lessonsBanner = AdMobServices.getBannerAds();
    lessonsBanner?.load();
    emit(LoadBannerState());
  }

  void loadLessonBanner() {
    lessonBanner = AdMobServices.getBannerAds();
    lessonBanner?.load();
    emit(LoadBannerState());
  }

  void loadSettingsBanner() {
    settingsBanner = AdMobServices.getBannerAds();
    settingsBanner?.load();
    emit(LoadBannerState());
  }

  void loadProfileBanner() {
    profileBanner = AdMobServices.getBannerAds();
    profileBanner?.load();
    emit(LoadBannerState());
  }

  void loadEditPBanner() {
    eProfileBanner = AdMobServices.getBannerAds();
    eProfileBanner?.load();
    emit(LoadBannerState());
  }

  void loadSentencesPBanner() {
    sentencesBanner = AdMobServices.getBannerAds();
    sentencesBanner?.load();
    emit(LoadBannerState());
  }

  InterstitialAd? interstitialAd;

  bool isLanguageContainerOpen = false;

  void changeLanguageContainerStatus() {
    isLanguageContainerOpen = !isLanguageContainerOpen;
    emit(ChangeLanguageContainerStatusState());
  }

  String appLanguage = CacheHelper.fontFamily == 'ar'
      ? 'ar'
      : CacheHelper.fontFamily == 'en'
          ? 'en'
          : 'tr'; // en --or-- ar
  String fontFamily =
      CacheHelper.fontFamily == 'ar' ? 'Janna' : 'ArchivoNarrow';

  void changeAppLanguage(String newValue) {
    appLanguage = newValue;
    emit(ChangeAppLanguageState());
    ////////////////
    CacheHelper.saveData(
      key: 'appLanguage',
      value: appLanguage,
    ).then((value) async {
      if (appLanguage == 'ar') {
        fontFamily = 'Janna';
        CacheHelper.updateFontFamily(fontFamily: newValue);
      } else {
        fontFamily = 'ArchivoNarrow';
        CacheHelper.updateFontFamily(fontFamily: newValue);
      }
      emit(ChangeAppLanguageSuccessState());
    });
  }

  bool isStudent = false;

  void handleGenderChange(bool value) {
    isStudent = value;
    emit(GenderChangeState());
  }

  bool isPasswordObscure = true;
  IconData icon = Icons.visibility;

  void changePasswordVisibility() {
    isPasswordObscure = !isPasswordObscure;
    icon = isPasswordObscure ? Icons.visibility : Icons.visibility_off;
    emit(ChangePasswordVisibilityState());
  }

  bool isConfirmPasswordObscure = true;
  IconData confirmIcon = Icons.visibility;

  void changeConfirmPasswordVisibility() {
    isConfirmPasswordObscure = !isConfirmPasswordObscure;
    confirmIcon =
        isConfirmPasswordObscure ? Icons.visibility : Icons.visibility_off;
    emit(ChangeConfirmPasswordVisibilityState());
  }

  bool isLoginPasswordObscure = true;
  IconData loginIcon = Icons.visibility;

  void changeLoginPasswordVisibility() {
    isLoginPasswordObscure = !isLoginPasswordObscure;
    loginIcon =
        isLoginPasswordObscure ? Icons.visibility : Icons.visibility_off;
    emit(ChangeLoginPasswordVisibilityState());
  }

  ////////////////////////

  void splashTimer() async {
    await Future.delayed(
        const Duration(seconds: 4), () => emit(SplashscreenLoading()));
  }

  int bottomNavIndex = 0;

  List<String> screenTitles = [
    'Levels',
    'Rules',
  ];

  List<Widget> screensStudent = const [
   // LevelsScreen(),
    RulesScreen(),
  ];

  void changeBottomNavIndex(int value) {
    bottomNavIndex = value;
    emit(BottomNavChangedState());
  }

  Country? country;
  bool isCountryChanged = false;

  List<DropdownMenuItem<Country>>? buildDropdownMenuItemsFrom(List countries) {
    List<DropdownMenuItem<Country>> items = [];
    for (Country country in countries) {
      String flag = country.countryFlag.toUpperCase().replaceAllMapped(
          RegExp(r'[A-Z]'),
          (match) =>
              String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));
      items.add(
        DropdownMenuItem(
          value: country,
          child: SizedBox(width: 200, child: Text('${country.name}  $flag')),
        ),
      );
    }

    return items;
  }

  onChangeDropdownItemFrom(Country? selectedCountryFrom) {
    country = selectedCountryFrom!;
    isCountryChanged = true;

    print('sp from ${country!.countryCode}');
    emit(changeCountryState());
  }

//////////////payment/////////////////////

  //auth token

  FirstToken? firstToken;

  Future getFirstToken() async {
    emit(PaymentInitialState());
    DioHelperPayment.postData(
        url: 'auth/tokens',
        data: {"api_key": paymobApiKey}).then((value) async {
      paymobToken = value.data['token'];
      print("first token : $paymobToken");
      await getOrderId(CacheHelper.name, CacheHelper.name, CacheHelper.email,
          CacheHelper.phone, '10000', CacheHelper.country);
      emit(PaymentSuccessState());
    }).catchError((error) {
      print("error : $error");
      emit(PaymentErrorState(error.toString()));
    });
  }

  Future getOrderId(String firstName, String lastName, String email,
      String phone, String price, String country) async {
    emit(PaymentOrderIDLoadingState());
    DioHelperPayment.postData(url: 'ecommerce/orders', data: {
      "auth_token": paymobToken,
      "delivery_needed": "false",
      "amount_cents": price,
      "items": []
    }).then((value) async {
      orderId = value.data['id'].toString();
      print("order Id : $orderId");
      emit(PaymentOrderIDSuccessState());
    }).catchError((error) {
      print("error : $error");
      emit(PaymentOrderIDErrorState(error.toString()));
    });
  }

  Future getFinalTokenCard() async {
    emit(PaymentRequestTokenCardLoadingState());
    DioHelperPayment.postData(url: 'acceptance/payment_keys', data: {
      "auth_token": paymobToken,
      "amount_cents": '10000',
      "expiration": 3600,
      "order_id": orderId,
      "billing_data": {
        "apartment": "NA",
        "email": CacheHelper.email,
        "floor": CacheHelper.userId,
        "first_name": CacheHelper.name,
        "street": "NA",
        "building": "NA",
        "phone_number": CacheHelper.phone,
        "shipping_method": "NA",
        "postal_code": "NA",
        "city": "NA",
        "country": CacheHelper.country,
        "last_name": CacheHelper.name,
        "state": "NA"
      },
      "currency": "EGP",
      "integration_id": integrationIdCard,
      "lock_order_when_paid": "false"
    }).then((value) async {
      finalTokenCard = value.data['token'].toString();
      print("finalTokenCard : $finalTokenCard");
      emit(PaymentRequestTokenCardSuccessState());
    }).catchError((error) {
      print("error : $error");
      emit(PaymentRequestTokenCardErrorState(error.toString()));
    });
  }

  Future getFinalTokenCardForWallet(
    phoneController,
  ) async {
    emit(PaymentRequestTokenCardForWalletLoadingState());
    DioHelperPayment.postData(url: 'acceptance/payment_keys', data: {
      "auth_token": paymobToken,
      "amount_cents": '10000',
      "expiration": 3600,
      "order_id": orderId,
      "billing_data": {
        "apartment": "NA",
        "email": CacheHelper.email,
        "floor": CacheHelper.userId,
        "first_name": CacheHelper.name,
        "street": "NA",
        "building": "NA",
        "phone_number": CacheHelper.phone,
        "shipping_method": "NA",
        "postal_code": "NA",
        "city": "NA",
        "country": CacheHelper.country,
        "last_name": CacheHelper.name,
        "state": "NA"
      },
      "currency": "EGP",
      "integration_id": integrationIdWallet,
      "lock_order_when_paid": "false"
    }).then((value) async {
      finalTokenCard = value.data['token'].toString();
      await getFinalUrlWallet(phoneController);
      print("finalTokenCard : $finalTokenCard");
      emit(PaymentRequestTokenCardForWalletSuccessState());
    }).catchError((error) {
      print("error : $error");
      emit(PaymentRequestTokenCardForWalletErrorState(error.toString()));
    });
  }

  Future getFinalUrlWallet(mobileNumber) async {
    emit(PaymentRequestWalletLoadingState());
    DioHelperPayment.postData(url: 'acceptance/payments/pay', data: {
      "source": {"identifier": mobileNumber, "subtype": "WALLET"},
      "payment_token": finalTokenCard
    }).then((value) async {
      urlMobileWallet = value.data['redirect_url'].toString();
      print("urlMobileWallet : $urlMobileWallet");
      emit(PaymentRequestWalletSuccessState());
    }).catchError((error) {
      print("error : $error");
      emit(PaymentRequestWalletErrorState(error.toString()));
    });
  }

  Future getFinalTokenKiosk() async {
    emit(PaymentRequestTokenKioskLoadingState());
    DioHelperPayment.postData(url: 'acceptance/payment_keys', data: {
      "auth_token": paymobToken,
      "amount_cents": '10000',
      "expiration": 3600,
      "order_id": orderId,
      "billing_data": {
        "apartment": "NA",
        "email": userModel!.email!,
        "floor": "NA",
        "first_name": userModel!.fullName!,
        "street": "NA",
        "building": "NA",
        "phone_number": userModel!.phone!,
        "shipping_method": "NA",
        "postal_code": "NA",
        "city": "NA",
        "country": userModel!.country!,
        "last_name": userModel!.fullName!,
        "state": "NA"
      },
      "currency": "EGP",
      "integration_id": integrationIdKiosk,
      "lock_order_when_paid": "false"
    }).then((value) async {
      finalTokenKiosk = value.data['token'].toString();
      print("finalTokenKiosk : $finalTokenKiosk");
      emit(PaymentRequestTokenKioskSuccessState());
      await getRefCode();
    }).catchError((error) {
      print("error : $error");
      emit(PaymentRequestTokenKioskErrorState(error.toString()));
    });
  }

  Future getRefCode() async {
    emit(PaymentRefCodeLoadingState());
    DioHelperPayment.postData(url: 'acceptance/payments/pay', data: {
      "source": {"identifier": "AGGREGATOR", "subtype": "AGGREGATOR"},
      "payment_token": finalTokenKiosk
    }).then((value) {
      refCode = value.data['id'].toString();
      print("refCode : $refCode");
      emit(PaymentRefCodeSuccessState());
    }).catchError((error) {
      print("error : $error");
      emit(PaymentRefCodeErrorState(error.toString()));
    });
  }

  List<PaymentModel> listOfPaymentModels = [];

  Future<void> getPayments({required year}) async {
    emit(GetPaymentsLoadingState());
    try {
      final response =
          await DioHelper.get(endPoint: 'api/v1/payments?year=$year');
      if (response.statusCode == 200) {
        listOfPaymentModels = [];
        for (var data in response.data['data']) {
          listOfPaymentModels.add(PaymentModel.fromJson(data));
        }
        emit(GetPaymentsSuccessState());
      } else {
        emit(GetPaymentsErrorState(response.statusCode.toString()));
      }
    } catch (e) {
      print('Error GetPaymentsErrorState: ${e.toString()}');
      emit(GetPaymentsErrorState(e.toString()));
    }
  }

////////////////////////////////

//////authentication/////////////////

  Future<void> createEmail({
    required email,
    required password,
    required name,
    required phone,
    required secQ1A,
    required secQ2A,
  }) async {
    emit(SignUpInitialState());

    UserModel model = UserModel(
      email: email,
      password: password,
      fullName: name,
      phone: phone,
      country: country!.name,
      secQ1A: secQ1A,
      secQ2A: secQ2A,
      student: isStudent,
    );
    try {
      final response = await DioHelper.postData(
        endPoint: 'api/v1/auth/signup',
        data: model.toCreateJson(),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        // هو عامله 201
        showToast(
            msg: 'successfully registered'.tr(), state: ToastStates.SUCCESS);
        emit(SignUpSuccessState());
        await loginWithEmailAndPassword(email: email, pass: password);
      } else {
        emit(SignUpErrorState(response.statusCode.toString()));
      }
    } catch (e) {
      print('Error createEmail:  ${e.toString()}');
      emit(SignUpErrorState(e.toString()));
    }
  }

  Future<void> loginWithEmailAndPassword({
    required email,
    required pass,
  }) async {
    emit(LogInInitialState());

    try {
      final response = await DioHelper.postData(
        endPoint: 'api/v1/auth/login',
        data: {"email": email, "password": pass},
      );
      if (response.statusCode == 200) {
        // هو عامله 302

        CommonComponents.saveData(
            key: 'id', value: response.data['data']['id']);

        await getUserData();
        emit(LogInSuccessState());
      } else {
        emit(LogInErrorState(response.statusCode.toString()));
      }
    } catch (e) {
      print('Error loginWithEmailAndPassword: ${e.toString()}');
      emit(LogInErrorState(e.toString()));
    }
  }

  SecurityModel? securityModel;
  String? resetEmail;

  Future<void> getVerificationAnswers(
      {required email, required context}) async {
    emit(GetVerificationAnswersLoadingState());
    try {
      final response = await DioHelper.get(
          endPoint: 'api/v1/auth/security-answers', data: {"email": email});
      if (response.statusCode == 200) {
        // هو عامله 302
        securityModel = SecurityModel.fromJson(response.data['data']);
        Navigator.pushReplacementNamed(
          context,
          Routes.identityScreen,
        );
        emit(GetVerificationAnswersSuccessState());
      } else {
        emit(GetVerificationAnswersErrorState(response.statusCode.toString()));
      }
    } catch (e) {
      print('Error GetVerificationAnswersErrorState: ${e.toString()}');
      emit(GetVerificationAnswersErrorState(e.toString()));
    }
  }

  Future<void> resetPassword(
      {required email, required newPassword, required context}) async {
    emit(ResetInitialState());
    try {
      final response = await DioHelper.postData(
          endPoint: 'api/v1/auth/reset-password',
          data: {"email": email, "password": newPassword});
      if (response.statusCode == 200) {
        Navigator.pushNamedAndRemoveUntil(
            context, Routes.loginScreen, (Route<dynamic> route) => false);
        emit(ResetSuccessState());
      } else {
        emit(ResetErrorState(response.statusCode.toString()));
      }
    } catch (e) {
      print('Error resetPassword: ${e.toString()}');
      emit(ResetErrorState(e.toString()));
    }
  }

/////////////////////////////////////

////////////// user ////////////////////
  UserModel? userModel;

  Future<void> getUserData() async {
    emit(GetUserLoadingState());
    String id = CacheHelper.userId;
    try {
      final response = await DioHelper.get(
        endPoint: 'api/v1/users/$id',
      );
      if (response.statusCode == 200) {
        // هو عامله 200
        userModel = UserModel.fromJson(response.data['data']);
        CacheHelper.saveUserData(
          id: userModel!.id!,
          name: userModel!.fullName!,
          password: userModel!.password!,
          phone: userModel!.phone!,
          country: userModel!.country!,
          userType: userModel!.subscriptionStatus!,
          email: userModel!.email!,
        );
        print(userModel!.subscriptionStatus!);
        emit(GetUserSuccessState());
      } else {
        emit(GetUserErrorState(response.statusCode.toString()));
      }
    } catch (e) {
      print('Error getUserData: ${e.toString()}');
      emit(GetUserErrorState(e.toString()));
    }
  }

  Future<void> deleteUserData({required context}) async {
    emit(DeleteUserLoadingState());
    String id = CommonComponents.getSavedData('id') ?? '';
    print('iddddddd: $id');
    try {
      final response = await DioHelper.delete(
        endPoint: 'api/v1/auth/users/$id',
      );
      if (response.statusCode == 200) {
        Navigator.pushNamedAndRemoveUntil(
            context, Routes.loginScreen, (Route<dynamic> route) => false);
        emit(DeleteUserSuccessState());
      } else {
        emit(DeleteUserErrorState(response.statusCode.toString()));
      }
    } catch (e) {
      print('Error DeleteUserErrorState: ${e.toString()}');
      emit(DeleteUserErrorState(e.toString()));
    }
  }

  Future<void> updateUserData(
      {required phone, required fullName, required context}) async {
    emit(UpdateUserLoadingState());
    String id = CommonComponents.getSavedData('id') ?? '';
    try {
      final response =
          await DioHelper.patch(endPoint: 'api/v1/users/$id', data: {
        'phone': phone,
        'fullName': fullName,
      });
      if (response.statusCode == 200) {
        await getUserData();
        Navigator.pop(context);
        emit(UpdateUserSuccessState());
      } else {
        emit(UpdateUserErrorState(response.statusCode.toString()));
      }
    } catch (e) {
      print('Error UpdateUserErrorState: ${e.toString()}');
      emit(UpdateUserErrorState(e.toString()));
    }
  }

  Future<void> makeStatusPending() async {
    emit(UpdateUserLoadingState());
    String id = CommonComponents.getSavedData('id') ?? '';
    try {
      final response =
          await DioHelper.patch(endPoint: 'api/v1/auth/users/$id', data: {
        'status': 'Pending',
      });
      if (response.statusCode == 200) {
        emit(UpdateUserSuccessState());
      } else {
        emit(UpdateUserErrorState(response.statusCode.toString()));
      }
    } catch (e) {
      print('Error UpdateUserErrorState: ${e.toString()}');
      emit(UpdateUserErrorState(e.toString()));
    }
  }

/////////////////////////////////////////////////////////

///////////////Levels/////////////////////////

  //late final dynamic decryptedData;

  // String decryptAES(String encryptedText, String keyString) {
  //   final key = encrypt.Key.fromUtf8(keyString);
  //   final iv = encrypt.IV.fromLength(16);
  //   final encrypter = encrypt.Encrypter(encrypt.AES(key));
  //   final encryptedData = encrypt.Encrypted.fromBase64(encryptedText);
  //   final decrypted = encrypter.decrypt(encryptedData, iv: iv);
  //   return decrypted;
  // }
  // void vdecryptAES() {
  //   final key = encrypt.Key.fromUtf8('OcbjDea7a9qENwpkKsh8jJ5DMqJgpned32q1yDnC6PczcLfufwKiCpUcHxxd/Ynf');
  //   final iv = encrypt.IV.fromLength(16);
  //   final encrypter = encrypt.Encrypter(encrypt.AES(key));
  //   final encryptedData = encrypt.Encrypted.fromBase64('aGkgaXQncyBob3NzYW0gaGVyZSA6KQ==');
  //   final decrypted = encrypter.decrypt(encryptedData, iv: iv);
  //   print('******************************************') ;
  //   print('******************************************') ;
  //   print(decrypted) ;
  // }


  String? decryptAES(String encryptedText, String keyString) {
    try {
      final key = encrypt.Key.fromUtf8(keyString);
      final iv = encrypt.IV.fromLength(16);
      final encrypter = encrypt.Encrypter(encrypt.AES(key));
      final decrypted = encrypter.decrypt64(encryptedText, iv: iv);
      return decrypted;
    } catch (e) {
      print('Error during decryption: $e');
      return null;
    }
  }

/*
  Future<void> getLevels({required level}) async {
    emit(GetLevelLoadingState());
    try {
      final response = await DioHelper.get(
        endPoint: 'api/v1/levels/$level/text',
      );

      if (response.statusCode == 200) {

        dynamic decryptedData =
            utf8.decode(base64.decode(response.data['data']));

        dynamic jsonData = jsonDecode(decryptedData);
        if (level == 1) {
          for (var data in jsonData) {
            listOfLevelOne.add(LevelModel.fromJson(data));
          }
        } else if (level == 2) {
          for (var data in jsonData) {
            listOfLevelTwo.add(LevelModel.fromJson(data));
          }
        } else if (level == 3) {
          for (var data in jsonData) {
            listOfLevelThree.add(LevelModel.fromJson(data));
          }
        }
        emit(GetLevelSuccessState());
      } else {
        emit(GetLevelErrorState('Failed to decrypt data'));
      }
    } catch (e) {
      print('Error GetLevelErrorState: $e');
      emit(GetLevelErrorState(e.toString()));
    }
  }
*/
  List<LevelModel> listOfLevelOne = [];
  List<LevelModel> listOfLevelTwo = [];
  List<LevelModel> listOfLevelThree = [];
  int? levelNumber;
  String? levelType;

  Future<void> getLevels({required level, required type}) async {
    emit(GetLevelLoadingState());
     levelNumber = level;
     levelType = type;
     listOfLevelOne = [];
     listOfLevelTwo = [];
     listOfLevelThree = [];
    try {
      final response = await DioHelper.get(
        endPoint: 'api/v1/levels/$level/$type',
      );
      if (response.statusCode == 200) {
        // هو عامله 200
        if (level == 1) {
          for (var data in response.data['data']) {
              listOfLevelOne.add(LevelModel.fromJson(data));
          }
        } else if (level == 2) {
          for (var data in response.data['data']) {
              listOfLevelTwo.add(LevelModel.fromJson(data));
          }
        } else if (level == 3) {
          for (var data in response.data['data']) {
              listOfLevelThree.add(LevelModel.fromJson(data));
          }
        }
        emit(GetLevelSuccessState());
      } else {
        emit(GetLevelErrorState(response.statusCode.toString()));
      }
    } catch (e) {
      print('Error GetLevelErrorState: ${e.toString()}');
      emit(GetLevelErrorState(e.toString()));
    }
  }

  List<LevelModel> listOfSearchResultOne = [];
  List<LevelModel> listOfSearchResultTwo = [];
  List<LevelModel> listOfSearchResultThree = [];

  void search(String keyword, int level) {
    if (level == 1) {
      listOfSearchResultOne = listOfLevelOne.where((level) {
        return level.title!.toLowerCase().contains(keyword.toLowerCase());
      }).toList();
    } else if (level == 2) {
      listOfSearchResultTwo = listOfLevelTwo.where((level) {
        return level.title!.toLowerCase().contains(keyword.toLowerCase());
      }).toList();
    } else {
      listOfSearchResultThree = listOfLevelThree.where((level) {
        return level.title!.toLowerCase().contains(keyword.toLowerCase());
      }).toList();
    }
    emit(SearchState());
  }

  void searchSentences(
    String keyword,
  ) {
    searchStatements = statementsT.where((statement) {
      return statement.toLowerCase().contains(keyword.toLowerCase());
    }).toList();

    emit(SearchState());
  }

  LessonModel? lessonModel;
  String turkeyStatements = '';
  String englishStatements = '';
  String arabicStatements = '';
  List<String> statementsT = [],
      statementsE = [],
      statementsA = [],
      defaultStatements = [],
      searchStatements = [];

  // List<String> url = [];

  Future<void> getLesson({required String id, required context}) async {
    emit(GetLessonLoadingState());
    lessonModel = null;
/*    turkeyStatements = '';
    englishStatements = '';
    arabicStatements = '';*/
    statementsT = [];
    statementsE = [];
    statementsA = [];
    defaultStatements = [];
    // url =[];
    try {
      final response = await DioHelper.get(
        endPoint: 'api/v1/lessons/$id',
      );
      if (response.statusCode == 200) {
/*
        dynamic jsonData =
            utf8.decode(base64.decode(response.data['data']));

        log(decryptedData);
        Map<String, dynamic> jsonData = jsonDecode(decryptedData);
        log(jsonData.toString());
*/
        lessonModel = LessonModel.fromJson(response.data['data']);
        statementsT.addAll(lessonModel!.trStatements!);
        statementsE.addAll(lessonModel!.enStatements!);
        statementsA.addAll(lessonModel!.arStatements!);

/*        for (var entry in lessonModel!.statements!.entries) {
          statementsT.add(entry.key);
          statementsE.add(entry.value.english!);
          statementsA.add(entry.value.arabic!);
          //url.add(entry.value.url!);
          turkeyStatements = '$turkeyStatements ${entry.key}';
          englishStatements = '$englishStatements ${entry.value.english!}';
          arabicStatements = '$arabicStatements ${entry.value.arabic!}';
        }*/
        //currentStatements = turkeyStatements;
        defaultStatements = statementsT;
        Navigator.pushNamed(context, Routes.lessonScreen);
        emit(GetLessonSuccessState());
      } else {
        emit(GetLessonErrorState(response.statusCode.toString()));
      }
    } catch (e) {
      print('Error GetLessonErrorState: ${e.toString()}');
      emit(GetLessonErrorState(e.toString()));
    }
  }

  String? currentStatements;

  changeStatementsLanguage(List<String> newStatements) {
    // currentStatements = newLang;
    defaultStatements = newStatements;
    emit(ChangeStatementsLanguageState());
  }

  String extractVideoId(String youtubeUrl) {
    Uri uri = Uri.parse(youtubeUrl);
    String videoId = uri.queryParameters['v'] ?? '';

    return videoId;
  }

  FlutterTts flutterTts = FlutterTts();

  Future<void> textToSpeech(String text) async {
    emit(AudioLoading());
    await flutterTts.setLanguage("tr-TR");
    await flutterTts.setVolume(0.5);
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.setPitch(1);
    await flutterTts.speak(text);
    emit(AudioLoaded());
  }

/////////////////////////////////////////////

////////////////Rules/////////////////////

  List<String> listOfTypes = [];

  Future<void> getTypes() async {
    emit(GetTypesLoadingState());
    try {
      final response = await DioHelper.get(
        endPoint: 'api/v1/rules-lessons/types',
      );
      if (response.statusCode == 200) {
        listOfTypes = ['all'];
        for (var data in response.data['data']) {
          listOfTypes.add(data);
        }
        emit(GetTypesSuccessState());
      } else {
        emit(GetTypesErrorState(response.statusCode.toString()));
      }
    } catch (e) {
      print('Error GetTypesErrorState: ${e.toString()}');
      emit(GetTypesErrorState(e.toString()));
    }
  }

  List<DropdownMenuItem<String>>? buildDropdownTypesItemsFrom(cubit) {
    List<DropdownMenuItem<String>> items = [];
    for (String type in listOfTypes) {
      items.add(
        DropdownMenuItem(
          value: type,
          child: Row(
            children: [
              Icon(
                CupertinoIcons.arrowshape_turn_up_right,
                size: 18.w,
              ),
              SizedBox(
                width: 8.w,
              ),
              SizedBox(
                child: Text(
                  type,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: textStyle(cubit,
                      size: 14.sp, fontFamily: 'ArchivoNarrow'),
                ),
              ),
            ],
          ),
        ),
      );
    }
    return items;
  }

  String? currentType;
  bool isTypeChanged = false;

  onChangeDropdownTypeItemFrom(String? selectedType) async {
    currentType = selectedType!;
    isTypeChanged = true;
    await getRules(type: selectedType);
    emit(ChangeTypeState());
  }

  List<RulesModel> listOfRules = [];

  Future<void> getRules({required type}) async {
    emit(GetRulesLoadingState());
    try {
      final response = await DioHelper.get(
        endPoint: 'api/v1/rules-lessons/type/$type',
      );
      if (response.statusCode == 200) {
        listOfRules = [];
        for (var data in response.data['data']) {
          listOfRules.add(RulesModel.fromJson(data));
        }
        emit(GetRulesSuccessState());
      } else {
        emit(GetRulesErrorState(response.statusCode.toString()));
      }
    } catch (e) {
      print('Error GetRulesErrorState: ${e.toString()}');
      emit(GetRulesErrorState(e.toString()));
    }
  }

  String? videoLink;

  makeVideoLinkEqualNull() {
    videoLink = null;
    emit(MakeVideoNullState());
  }

  Future<void> deleteRule({required context, required id}) async {
    emit(DeleteRuleLoadingState());
    try {
      final response = await DioHelper.delete(
        endPoint: 'api/v1/rules-lessons/$id',
      );
      if (response.statusCode == 200) {
        await getTypes();
        await getRules(type: currentType ?? 'all');
        Navigator.pop(context);
        emit(DeleteRuleSuccessState());
      } else {
        emit(DeleteRuleErrorState(response.statusCode.toString()));
      }
    } catch (e) {
      print('Error DeleteRuleErrorState: ${e.toString()}');
      emit(DeleteRuleErrorState(e.toString()));
    }
  }

  Future<void> addRule(
      {required title, required type, required videoUrl}) async {
    emit(AddRuleLoadingState());
    try {
      final response = await DioHelper.postData(
          endPoint: 'api/v1/rules-lessons',
          data: {"title": title, "type": type, "videoUrl": videoUrl});
      if (response.statusCode == 200 || response.statusCode == 201) {
        await getTypes();
        await getRules(type: currentType ?? 'all');
        emit(AddRuleSuccessState());
      } else {
        emit(AddRuleErrorState(response.statusCode.toString()));
      }
    } catch (e) {
      print('Error AddRuleErrorState: ${e.toString()}');
      emit(AddRuleErrorState(e.toString()));
    }
  }

  Future<void> updateRule({
    required context,
    required id,
    required title,
    required type,
    required videoUrl,
  }) async {
    emit(UpdateRuleLoadingState());
    try {
      final response = await DioHelper.patch(
        endPoint: 'api/v1/rules-lessons/$id',
        data: {
          "title": title,
          "type": type,
          "videoUrl": videoUrl,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        await getTypes();
        await getRules(type: currentType ?? 'all');
        Navigator.pop(context);
        emit(UpdateRuleSuccessState());
      } else {
        emit(UpdateRuleErrorState(response.statusCode.toString()));
      }
    } catch (e) {
      print('Error UpdateRuleErrorState: ${e.toString()}');
      emit(UpdateRuleErrorState(e.toString()));
    }
  }

/////////////////////////////////////////
}
