import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sunray_news/app/core/extensions/theme_extensions.dart';
import 'package:sunray_news/app/modules/main/cubit/main_view_cubit.dart';
import 'package:tabler_icons/tabler_icons.dart';

import 'setting_dialog.dart';

class BottomNavBarComponent extends StatelessWidget {
  const BottomNavBarComponent({super.key, required this.pageController});

  final PageController pageController;

  void showSettingDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => SettingDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainViewCubit, MainViewState>(
      builder: (context, state) {
        return SizedBox(
          height: 60.h,
          child: BottomNavigationBar(
              currentIndex: state.currentPageIndex,
              onTap: (value) {
                if (value > 2) {
                  showSettingDialog(context);
                  print("value $value");
                  return;
                }

                pageController.animateToPage(value,
                    duration: Duration(milliseconds: 200),
                    curve: Curves.linear);

                context.read<MainViewCubit>().onPageChange(value);
              },
              useLegacyColorScheme: true,
              elevation: 3,
              backgroundColor: context.primaryColor,
              selectedIconTheme: IconThemeData(
                color: context.secondaryColor,
              ),
              unselectedIconTheme: IconThemeData(
                color: context.theme.colorScheme.onBackground,
              ),
              selectedItemColor: context.secondaryColor,
              selectedFontSize: 15,
              showUnselectedLabels: true,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(
                      TablerIcons.news,
                    ),
                    tooltip: "News",
                    label: "News"),
                BottomNavigationBarItem(
                    icon: Icon(TablerIcons.search),
                    tooltip: "Search",
                    label: "Search"),
                BottomNavigationBarItem(
                    icon: Icon(TablerIcons.bookmark),
                    tooltip: "Bookmark",
                    label: "Bookmark"),
                BottomNavigationBarItem(
                    icon: Icon(
                      TablerIcons.settings,
                      color: context.secondaryColor,
                    ),
                    tooltip: "Settings",
                    label: "Settings")
              ]),
        );
      },
    );
  }
}
