import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pen/Bloc/Cubit/app_cubit.dart';
import 'package:pen/Bloc/Cubit/app_states.dart';
import 'package:pen/Theme/app_colors.dart';
import 'package:pen/Theme/style.dart';
import 'package:pen/Theme/text_style.dart';

class FAQsScreen extends StatelessWidget {
  final List<String> questions = [
    'What stages does the application provide for learning the Turkish language?'
        .tr(),
    'What is the role of grammar videos in developing language skills in an application?'.tr(),
    'How can the account be upgraded to the premium level?'.tr(),
  ];

  final List<String> answers = [
    'Our app provides advanced Turkish language lessons in three levels: Beginner, Intermediate, and Advanced, along with translations to Arabic and English for sentences, texts, and words.'.tr(),
    "Our app's grammar videos offer diverse content to enhance Turkish language skills, improving understanding and proficiency.".tr(),
    'Upgrade your account to premium and enjoy all features ad-free, providing an uninterrupted learning experience.'.tr(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'FAQs'.tr(),
              style: textStyle(
                AppCubit.get(context),
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                SizedBox(
                  height: 200,
                  child: Image.asset(
                    'assets/images/splash.png',
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      if (index == questions.length) {
                        return SizedBox(
                          height: 30.h,
                        );
                      }
                      return CustomExpansionTile(
                        question: questions[index],
                        answer: answers[index],
                      );
                    },
                    itemCount: questions.length + 1,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class CustomExpansionTile extends StatefulWidget {
  final String question;
  final String answer;

  CustomExpansionTile({
    required this.question,
    required this.answer,
  });

  @override
  State<CustomExpansionTile> createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> {
  bool? isExpanded;

  @override
  void initState() {
    isExpanded = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Flexible(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ExpansionTile(
                backgroundColor: Colors.transparent,
                collapsedBackgroundColor: Colors.transparent,
                collapsedIconColor: Colors.grey,
                iconColor: AppColors.defaultAppColor,
                collapsedTextColor: Colors.grey,
                onExpansionChanged: (bool value) {
                  setState(() {
                    isExpanded = value;
                  });
                },
                title: Text(
                  widget.question,
                  style: fontRegular.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                children: <Widget>[
                  ListTile(
                    title: Text(
                      widget.answer,
                      style: fontRegular.copyWith(
                        fontSize: 13,
                        color: Colors.black54,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
