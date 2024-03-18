import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:pen/Models/rules_model.dart';
import 'package:pen/Theme/text_style.dart';

import '../../Bloc/Cubit/app_cubit.dart';
import '../../Bloc/Cubit/app_states.dart';
import '../../Config/common_components.dart';
import '../../Theme/app_colors.dart';
import '../../Widgets/button_global.dart';
import '../../Widgets/text_field_widget.dart';

// ignore: must_be_immutable
class UpdateRuleScreen extends StatelessWidget {
  const UpdateRuleScreen({Key? key, required this.rulesModel})
      : super(key: key);
  final RulesModel rulesModel;

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();

    TextEditingController titleController =
        TextEditingController(text: rulesModel.title);

    TextEditingController typeController =
        TextEditingController(text: rulesModel.type);

    TextEditingController videoUrlController =
        TextEditingController(text: rulesModel.videoUrl);

    return BlocConsumer<AppCubit, AppStates>(
      listener: (BuildContext context, Object? state) {},
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
                    (state is UpdateRuleLoadingState ||
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
                              if (titleController.text.trim() !=
                                      rulesModel.title ||
                                  typeController.text.trim() !=
                                      rulesModel.type ||
                                  videoUrlController.text.trim() !=
                                      rulesModel.videoUrl) {
                                if (formKey.currentState!.validate()) {
                                  await cubit.updateRule(
                                    context: context,
                                    id: rulesModel.id,
                                    title: titleController.text.trim(),
                                    type: typeController.text.trim(),
                                    videoUrl: videoUrlController.text.trim(),
                                  );
                                }
                              } else {
                                showToast(
                                    msg: 'There is no change in data'.tr(),
                                    state: ToastStates.ERROR);
                              }
                            },
                            buttontext: "Update".tr(),
                          ),
                    SizedBox(
                      height: 15.h,
                    ),
                    (state is DeleteRuleLoadingState ||
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
                              color: AppColors.redAccent,
                            ),
                            onPressed: () async {
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.error,
                                animType: AnimType.rightSlide,
                                title: 'Remove'.tr(),
                                desc: "Are you sure about the removal?".tr(),
                                dialogBackgroundColor: AppColors.white,
                                titleTextStyle: textStyle(
                                  cubit,
                                  fontWeight: FontWeight.bold,
                                ),
                                descTextStyle: textStyle(cubit),
                                btnOkText: 'Remove'.tr(),
                                btnCancelText: 'Cancel'.tr(),
                                btnCancelColor: AppColors.thirdAppColor,
                                btnOkColor: AppColors.red,
                                btnCancelOnPress: () {},
                                btnOkOnPress: () async {
                                  await cubit.deleteRule(
                                    context: context,
                                    id: rulesModel.id,
                                  );
                                },
                              ).show();
                            },
                            buttontext: "Delete".tr(),
                          ),
                    SizedBox(
                      height: 15.h,
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
