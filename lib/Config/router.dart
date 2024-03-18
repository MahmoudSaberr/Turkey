import 'package:flutter/material.dart';
import 'package:pen/Screens/FAQsScreen/faqs_screen.dart';
import 'package:pen/Screens/IdentityScreen/identity_screen.dart';
import 'package:pen/Screens/LessonScreen/lesson_screen.dart';
import 'package:pen/Screens/PaymentScreens/mobile_wallet_screen.dart';
import 'package:pen/Screens/PaymentScreens/refcode_screen.dart';
import 'package:pen/Screens/PaymentScreens/visacard_screen.dart';
import 'package:pen/Screens/PaymentsScreen/payments_screen.dart';
import 'package:pen/Screens/PrivacyScreen/privacy_screen.dart';
import 'package:pen/Screens/RulesScreen/rules_screen.dart';
import 'package:pen/Screens/SentencesScreen/sentences_screen.dart';
import 'package:pen/Screens/SettingsScreen/setting_screen.dart';
import 'package:pen/Screens/UpdatePassScreen/update_pass_screen.dart';
import 'package:pen/Screens/VideoSceen/video_web_view_screen.dart';

import '../Screens/AddRule/add_rule_screen.dart';
import '../Screens/EditProfileScreen/edit_profile_screen.dart';
import '../Screens/ForgotPassScreen/forgot_pass_screen.dart';
import '../Screens/HomeScreen/bottom_navigation_screen.dart';
import '../Screens/LevelsScreen/levels_screen.dart';
import '../Screens/LoginScreen/login_screen.dart';
import '../Screens/PaymentScreens/toggle_screen.dart';
import '../Screens/ProfileScreen/profile_screen.dart';
import '../Screens/RegistrationScreen/register_screen.dart';
import '../Screens/SplashScreen/splash_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (context) => LoginScreen());
      case Routes.registerScreen:
        return MaterialPageRoute(builder: (context) => const RegisterScreen());
      case Routes.homeScreen:
        return MaterialPageRoute(
            builder: (context) => const BottomNavigationScreen());
/*
      case Routes.levelScreen:
        return MaterialPageRoute(builder: (context) => const LevelsScreen());
*/
      case Routes.rulesScreen:
        return MaterialPageRoute(builder: (context) => const RulesScreen());
      case Routes.profileScreen:
        return MaterialPageRoute(builder: (context) => const ProfileScreen());
      case Routes.editProfileScreen:
        return MaterialPageRoute(
            builder: (context) => const EditProfileScreen());
      case Routes.forgotPassScreen:
        return MaterialPageRoute(builder: (context) => ForgotPasswordScreen());
      case Routes.faqsScreen:
        return MaterialPageRoute(builder: (context) => FAQsScreen());
      case Routes.privacyScreen:
        return MaterialPageRoute(builder: (context) => const PrivacyScreen());
      case Routes.settingsScreen:
        return MaterialPageRoute(builder: (context) => const SettingsScreen());
      case Routes.updatePassScreen:
        return MaterialPageRoute(
            builder: (context) => const UpdatePassScreen());
      case Routes.identityScreen:
        return MaterialPageRoute(builder: (context) => IdentityScreen());
      case Routes.videoScreen:
        return MaterialPageRoute(builder: (context) => const VideoScreen());
      case Routes.addRuleScreen:
        return MaterialPageRoute(builder: (context) => const AddRuleScreen());
      case Routes.lessonScreen:
        return MaterialPageRoute(builder: (context) => const LessonScreen());
      case Routes.sentencesScreen:
        return MaterialPageRoute(builder: (context) => const SentencesScreen());
      case Routes.visaScreen:
        return MaterialPageRoute(builder: (context) => VisaCard());
      case Routes.refCodeScreen:
        return MaterialPageRoute(builder: (context) => const RefCode());
      case Routes.toggleScreen:
        return MaterialPageRoute(builder: (context) => const ToggleScreen());
      case Routes.walletScreen:
        return MaterialPageRoute(builder: (context) => MobileWalletScreen());
      case Routes.paymentsScreen:
        return MaterialPageRoute(builder: (context) => const PaymentsScreen());
      default:
        return null;
    }
  }
}

class Routes {
  static const splashScreen = '/splashScreen';
  static const homeScreen = '/homeScreen';
/*
  static const levelScreen = '/levelScreen';
*/
  static const rulesScreen = '/rulesScreen';
  static const loginScreen = '/loginScreen';
  static const registerScreen = '/registerScreen';
  static const forgotPassScreen = '/forgotPassScreen';
  static const profileScreen = '/profileScreen';
  static const editProfileScreen = '/editProfileScreen';
  static const faqsScreen = '/faqsScreen';
  static const privacyScreen = '/privacyScreen';
  static const settingsScreen = '/settingsScreen';
  static const updatePassScreen = '/updatePassScreen';
  static const identityScreen = '/identityScreen';
  static const videoScreen = '/videoScreen';
  static const addRuleScreen = '/addRuleScreen';
  static const lessonScreen = '/lessonScreen';
  static const sentencesScreen = '/sentencesScreen';
  static const visaScreen = '/visaScreen';
  static const refCodeScreen = '/refCodeScreen';
  static const walletScreen = '/walletScreen';
  static const toggleScreen = '/toggleScreen';
  static const paymentsScreen = '/paymentsScreen';
}
