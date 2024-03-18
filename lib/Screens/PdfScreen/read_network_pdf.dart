
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pen/Bloc/Cubit/app_cubit.dart';
import 'package:pen/Bloc/Cubit/app_states.dart';
import 'package:pen/Theme/app_colors.dart';
import 'package:pen/Theme/text_style.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfNetworkScreen extends StatelessWidget {
  String? title;
  String file;

  PdfNetworkScreen(this.file, this.title);

  PdfViewerController pdfViewerController = PdfViewerController();
  double zoom = 0.0;
  TextEditingController controller = TextEditingController();
  int pageNo = 0;

  jumpTo(BuildContext context, AppCubit cubit) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Enter page No to jump'.tr(),
            style: textStyle(cubit),
          ),
          content: TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            onChanged: (val) {
              pageNo = int.parse(val);
            },
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Cancel'.tr(),
                style: textStyle(cubit),
              ),
            ),
            TextButton(
              onPressed: () {
                pdfViewerController.jumpToPage(pageNo);
                Navigator.pop(context);
              },
              child: Text(
                'OK'.tr(),
                style: textStyle(cubit),
              ),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            title: Text(
              title!,
              style: textStyle(
                cubit,
                size: 14.sp,
                fontWeight: FontWeight.w300,
              ),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    pdfViewerController.previousPage();
                  },
                  icon: const Icon(Icons.arrow_back_ios)),
              IconButton(
                  onPressed: () {
                    pdfViewerController.nextPage();
                  },
                  icon: const Icon(Icons.arrow_forward_ios)),
              IconButton(
                  onPressed: () {
                    jumpTo(context, cubit);
                  },
                  icon: const Icon(Icons.search))
            ],
          ),
          body: SfPdfViewer.network(
            file,
            controller: pdfViewerController,
          ),
          floatingActionButton: Padding(
            padding: EdgeInsets.only(bottom: 8.h),
            child: Container(
              width: 110.w,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.defaultAppColor),
                borderRadius: BorderRadius.all(Radius.circular(10.r)),
                color:
                     AppColors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      pdfViewerController.zoomLevel = zoom + 1;
                      zoom++;
                    },
                    icon: const Icon(
                      Icons.zoom_in,
                      color: AppColors.defaultAppColor,
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  IconButton(
                    onPressed: () {
                      pdfViewerController.zoomLevel = 0.0;
                    },
                    icon: const Icon(
                      Icons.zoom_out,
                      color: AppColors.defaultAppColor,
                    ),
                  )
                ],
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        );
      },
    );
  }
}
