import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'Bloc/Cubit/app_cubit.dart';
import 'Bloc/Cubit/app_states.dart';
import 'Bloc/bloc_observer.dart';
import 'Config/common_components.dart';
import 'Config/dio_helper.dart';
import 'Config/dio_helper_payment.dart';
import 'Config/router.dart';
import 'Theme/custom_theme.dart';

String? fcmToken;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CommonComponents.initSharedPreferences();
  await EasyLocalization.ensureInitialized();
  await DioHelper.init();
  await DioHelperPayment.init();
  await MobileAds.instance.initialize();

  Bloc.observer = MyBlocObserver();
  runApp(
    BlocProvider(
      create: (context) => AppCubit()
        ..loadBanner()
        ..getTypes()
        ..getRules(type: 'all')
        ..getPayments(year: 0),
      child: EasyLocalization(
        supportedLocales: const [
          Locale('tr', 'TR'),
          Locale('ar', 'EG'),
          Locale("en", "US"),
        ],
        startLocale: const Locale('tr', 'TR'),
        fallbackLocale: const Locale('tr', 'TR'),
        path: 'assets/translations',
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final AppRouter appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Tercümeye Doğru',
            themeMode: ThemeMode.light,
            theme: CustomTheme.lightTheme(context),
            initialRoute: Routes.splashScreen,
            onGenerateRoute: appRouter.onGenerateRoute,
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              EasyLocalization.of(context)!.delegate,
            ],
            supportedLocales: context.supportedLocales,
            locale: context.locale,
          );
        },
      ),
    );
  }
}
