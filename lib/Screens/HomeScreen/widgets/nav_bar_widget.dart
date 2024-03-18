import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Bloc/Cubit/app_cubit.dart';
import '../../../Bloc/Cubit/app_states.dart';
import '../../../Theme/app_colors.dart';
import '../../../Theme/style.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final int defaultSelectedIndex;
  final Function(int) onChange;
  final List<IconData> selectedIconList;
  final List<IconData> unselectedIconList;
  final List<String> titleList;

  CustomBottomNavigationBar(
      {this.defaultSelectedIndex = 0,
      required this.onChange,
      required this.selectedIconList,
      required this.unselectedIconList,
      required this.titleList});

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;
  List<IconData> _selectedIconList = [];
  List<IconData> _unSelectedIconList = [];
  List<String> _titleList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _selectedIndex = widget.defaultSelectedIndex;
    _selectedIconList = widget.selectedIconList;
    _unSelectedIconList = widget.unselectedIconList;
    _titleList = widget.titleList;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> navBarItemList = [];

    for (var i = 0; i < _selectedIconList.length; i++) {
      navBarItemList.add(buildNavBarItem(
          _selectedIconList[i], _unSelectedIconList[i], _titleList[i], i));
    }

    return Material(
      elevation: 5,
      child: Row(
        children: navBarItemList,
      ),
    );
  }

  Widget buildNavBarItem(
      IconData selectedIcon, IconData unSelectedIcon, String title, int index) {
    return GestureDetector(
      onTap: () {
        widget.onChange(index);
        setState(() {
          _selectedIndex = index;
        });
      },
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return SizedBox(
            height: 60,
            width: MediaQuery.of(context).size.width / _selectedIconList.length,
/*            decoration: index == _selectedIndex
                ? const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          width: 4, color: AppColors.defaultAppColor),
                    ),
                    color: AppColors.thirdAppColor,
                  )
                : const BoxDecoration(),*/
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  index == _selectedIndex ? selectedIcon : unSelectedIcon,
                  color: index == _selectedIndex
                      ? AppColors.thirdAppColor
                      : AppColors.gray2,
                  size: 26.r,
                ),
/*
                Text(
                  title,
                  style: fontRegular.copyWith(fontSize: 12.sp),
                ),
*/
              ],
            ),
          );
        },
      ),
    );
  }
}
