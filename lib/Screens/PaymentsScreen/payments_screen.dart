import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pen/Bloc/Cubit/app_cubit.dart';
import 'package:pen/Bloc/Cubit/app_states.dart';
import 'package:pen/Theme/text_style.dart';
import 'package:pen/Widgets/empty_widget.dart';

import '../../Config/common_components.dart';
import '../../Theme/app_colors.dart';
import '../../Widgets/text_field_widget.dart';

class PaymentsScreen extends StatelessWidget {
  const PaymentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    TextEditingController yearController = TextEditingController();

    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: Text(
              'Subscriptions'.tr(),
              style: textStyle(
                cubit,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Form(
                        key: formKey,
                        child: AlertDialog(
                          title: Text(
                            'Enter Year'.tr(),
                            style: textStyle(
                              cubit,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              GlobalFormField(
                                controller: yearController,
                                cubit: cubit,
                                type: TextInputType.phone,
                                validate: (value) {
                                  if (value.isEmpty) {
                                    showToast(
                                        msg: 'Enter Year'.tr(),
                                        state: ToastStates.ERROR);
                                    return 'you must enter specific year to filter list'
                                        .tr();
                                  }
                                },
                                label: 'Year'.tr(),
                              ),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                'Cancel'.tr(),
                                style: textStyle(cubit),
                              ),
                            ),
                            TextButton(
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  Navigator.of(context).pop();
                                  await cubit.getPayments(
                                      year: yearController.text.trim());
                                }
                              },
                              child: Text(
                                'OK'.tr(),
                                style: textStyle(cubit),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                icon: const Icon(
                  CupertinoIcons.search_circle,
                  color: AppColors.black,
                ),
              ),
            ],
          ),
          body: cubit.listOfPaymentModels.isEmpty
              ? Center(child: emptyWidget('No Subscriptions yet'.tr(), cubit))
              : Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      (state is GetPaymentsLoadingState)
                          ? const LinearProgressIndicator()
                          : const SizedBox(),
                      Expanded(
                        child: ListView.builder(
                          physics: const AlwaysScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: cubit.listOfPaymentModels.length,
                          itemBuilder: (BuildContext context, index) {
                            return Padding(
                              padding: EdgeInsets.only(bottom: 5.h),
                              child: Card(
                                margin: const EdgeInsets.symmetric(vertical: 7),
                                elevation: 1,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7.0),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7.0),
                                    gradient: const LinearGradient(
                                      stops: [0.02, 0.02],
                                      colors: [
                                        AppColors.thirdAppColor,
                                        AppColors.white
                                      ],
                                    ),
                                  ),
                                  padding: EdgeInsetsDirectional.symmetric(
                                    vertical: 10.h,
                                    horizontal: 20.w,
                                  ),
                                  child: Column(
                                    children: [
                                      ListTile(
                                        leading: const Icon(
                                          CupertinoIcons.info_circle,
                                          color: AppColors.black,
                                        ),
                                        title: Text(
                                          cubit.listOfPaymentModels[index]
                                                  .id ??
                                              "",
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          style: textStyle(
                                            cubit,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      const Divider(
                                        height: 0,
                                        indent: 0,
                                        thickness: 1,
                                        color: AppColors.gray1,
                                      ),
                                      ListTile(
                                        leading: const Icon(
                                          CupertinoIcons.person,
                                          color: AppColors.black,
                                        ),
                                        title: Text(
                                          cubit.listOfPaymentModels[index]
                                                  .userModel!.fullName ??
                                              "",
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          style: textStyle(
                                            cubit,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      const Divider(
                                        height: 0,
                                        indent: 0,
                                        thickness: 1,
                                        color: AppColors.gray1,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: ListTile(
                                              leading: const Icon(
                                                CupertinoIcons.calendar_circle,
                                                color: AppColors.black,
                                              ),
                                              title: Text(
                                                '${cubit.listOfPaymentModels[index].subscriptionDate!} | ${cubit.listOfPaymentModels[index].subscriptionEndDate}',
                                                overflow: TextOverflow.ellipsis,
                                                style: textStyle(
                                                  cubit,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Divider(
                                        height: 0,
                                        indent: 0,
                                        thickness: 1,
                                        color: AppColors.gray1,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: ListTile(
                                              leading: const Icon(
                                                CupertinoIcons.staroflife,
                                                color: AppColors.black,
                                              ),
                                              title: Text(
                                                cubit.listOfPaymentModels[index]
                                                    .statue!,
                                                maxLines: 3,
                                                overflow: TextOverflow.ellipsis,
                                                style: textStyle(
                                                  cubit,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: ListTile(
                                              leading: const Icon(
                                                CupertinoIcons.rocket,
                                                color: AppColors.black,
                                              ),
                                              title: Text(
                                                cubit.listOfPaymentModels[index]
                                                    .year!
                                                    .toString(),
                                                maxLines: 3,
                                                overflow: TextOverflow.ellipsis,
                                                style: textStyle(
                                                  cubit,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
