import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import '../../../Bloc/Cubit/app_cubit.dart';
import '../../../Bloc/Cubit/app_states.dart';
import '../../Theme/app_colors.dart';
import '../../Theme/text_style.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  _VideoScreenScreenState createState() => _VideoScreenScreenState();
}

class _VideoScreenScreenState extends State<VideoScreen> {
  bool? alreadyRate;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  double _progress = 0;
  late InAppWebViewController inAppWebViewController;
  bool pullToRefreshEnabled = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);

        return WillPopScope(
          onWillPop: () async {
            var isLastPage = await inAppWebViewController.canGoBack();
            if (isLastPage) {
              inAppWebViewController.goBack();
              return false;
            }
            cubit.makeVideoLinkEqualNull();
            return true;
          }, //call function on back button press
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                'Lesson'.tr(),
                style: textStyle(
                  cubit,
                  fontWeight: FontWeight.bold,
                ),
              ),
              centerTitle: true,
              backgroundColor: AppColors.white,
              elevation: 0,
            ),
            body: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: Stack(
                        children: [
                          InAppWebView(
                            initialUrlRequest: URLRequest(
                              url: cubit.videoLink != null
                                  ? cubit.videoLink!.contains('https')
                                      ? Uri.parse(cubit.videoLink!)
                                      : Uri(
                                          scheme: 'https',
                                          host: cubit.videoLink!,
                                        )
                                  : Uri.parse('https://www.google.com/'),
                            ),
                            onWebViewCreated:
                                (InAppWebViewController controller) {
                              inAppWebViewController = controller;
                            },
                            onUpdateVisitedHistory:
                                (controller, url, androidIsReload) {},
                            onProgressChanged:
                                (InAppWebViewController controller,
                                    int progress) {
                              setState(() {
                                _progress = progress / 100;
                              });
                            },
                          ),
                          _progress < 1
                              ? LinearProgressIndicator(
                                  value: _progress,
                                )
                              : const SizedBox(),
                        ],
                      ),
                    ),
                  ),
          ),
        );
      },
    );
  }
}
