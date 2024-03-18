import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:pen/Config/constants.dart';

import '../../Bloc/Cubit/app_cubit.dart';
import '../../Bloc/Cubit/app_states.dart';
import '../../Config/cache_helper.dart';
import '../../Config/common_components.dart';
import '../../Config/router.dart';


class MobileWalletScreen extends StatelessWidget {
  MobileWalletScreen({Key? key}) : super(key: key);
  late InAppWebViewController inAppWebViewController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Mobile Wallet",),
            centerTitle: true,
            elevation: 0,
          ),
          body: InAppWebView(
            initialUrlRequest: URLRequest(
              url: Uri.parse(urlMobileWallet),
            ),
            onWebViewCreated: (InAppWebViewController controller) {
              inAppWebViewController = controller;
            },
            onUpdateVisitedHistory: (controller, url, androidIsReload) {
              print("url: ${url!.query}");
              if (url!.query.contains('success=true')) {
                CacheHelper.clear();
                Navigator.pushNamedAndRemoveUntil(
                    context, Routes.loginScreen, (route) => false);
                showToast(
                  msg: 'Log in again to see the changes'.tr(),
                  state: ToastStates.SUCCESS,
                );
              }
            },

            onProgressChanged:
                (InAppWebViewController controller, int progress) {},
          ),
        );
      },
    );
  }

}
