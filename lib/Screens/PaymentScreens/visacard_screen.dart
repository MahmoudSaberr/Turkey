import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:pen/Bloc/Cubit/app_cubit.dart';
import 'package:pen/Bloc/Cubit/app_states.dart';
import 'package:pen/Config/common_components.dart';
import 'package:pen/Theme/app_colors.dart';

import '../../Config/cache_helper.dart';
import '../../Config/constants.dart';
import '../../Config/router.dart';

class VisaCard extends StatelessWidget {
  VisaCard({super.key});

  late InAppWebViewController inAppWebViewController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Visa Card"),
            centerTitle: true,
          ),
          body: InAppWebView(
            initialUrlRequest: URLRequest(
              url: Uri.parse(
                  "https://accept.paymob.com/api/acceptance/iframes/812489?payment_token=$finalTokenCard"),
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
