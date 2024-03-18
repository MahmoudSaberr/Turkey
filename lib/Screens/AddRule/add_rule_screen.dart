import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:future_progress_dialog/future_progress_dialog.dart';
import 'package:pen/Models/rules_model.dart';
import 'package:pen/Theme/text_style.dart';

import '../../Bloc/Cubit/app_cubit.dart';
import '../../Bloc/Cubit/app_states.dart';
import '../../Config/common_components.dart';
import '../../Theme/app_colors.dart';
import '../../Widgets/button_global.dart';
import '../../Widgets/text_field_widget.dart';

// ignore: must_be_immutable
class AddRuleScreen extends StatefulWidget {
  const AddRuleScreen({Key? key}) : super(key: key);

  @override
  State<AddRuleScreen> createState() => _AddRuleScreenState();
}

class _AddRuleScreenState extends State<AddRuleScreen> {
  Future getFuture() {
    return Future(() async {
      await Future.delayed(const Duration(seconds: 3));
      return 'Hello, Future Progress Dialog!';
    });
  }

  Future<void> showProgressWithoutMsg(BuildContext context) async {
    await showDialog(
        context: context,
        builder: (context) => FutureProgressDialog(
              getFuture(),
            ));
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController titleController = TextEditingController();

  TextEditingController typeController = TextEditingController();

  TextEditingController videoUrlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (BuildContext context, Object? state) {
        if (state is AddRuleSuccessState) {
          Navigator.pop(context);
        }
      },
      builder: (BuildContext context, state) {
        AppCubit cubit = AppCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: Text(
              'Add Rule'.tr(),
              style: textStyle(
                cubit,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    GlobalFormField(
                      controller: titleController,
                      type: TextInputType.name,
                      validate: (value) {
                        if (value.isEmpty) {
                          showToast(
                              msg: 'please enter your title'.tr(),
                              state: ToastStates.ERROR);
                          return 'please enter your title'.tr();
                        }
                      },
                      label: 'Title'.tr(),
                      cubit: cubit,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    GlobalFormField(
                      controller: typeController,
                      type: TextInputType.text,
                      validate: (value) {
                        if (value.isEmpty) {
                          showToast(
                              msg: 'please enter your type'.tr(),
                              state: ToastStates.ERROR);
                          return 'please enter your type'.tr();
                        }
                      },
                      label: 'Type'.tr(),
                      cubit: cubit,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    GlobalFormField(
                      controller: videoUrlController,
                      cubit: cubit,
                      type: TextInputType.text,
                      onSubmit: (value) {},
                      validate: (value) {
                        if (value.isEmpty) {
                          showToast(
                              msg: 'enter your phone video url'.tr(),
                              state: ToastStates.ERROR);
                          return 'enter your phone video url'.tr();
                        }
                      },
                      label: 'Video Url'.tr(),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    (state is AddRuleLoadingState ||
                            state is GetRulesLoadingState ||
                            state is GetTypesLoadingState ||
                            state is GetTypesSuccessState)
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: AppColors.defaultAppColor,
                            ),
                          )
                        : ButtonGlobal(
                            padding: 0,
                            buttonDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: AppColors.amber500),
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                await cubit.addRule(
                                  title: titleController.text.trim(),
                                  type: typeController.text.trim(),
                                  videoUrl: videoUrlController.text.trim(),
                                );
                              }
                            },
                            buttontext: "Add".tr(),
                          ),
                    SizedBox(
                      height: 20.h,
                    ),
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
