import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        return BottomNavigationBar(
            currentIndex: state.currentPageIndex,
            onTap: (value) {
              if (value > 2) return;

              pageController.animateToPage(value,
                  duration: Duration(milliseconds: 200), curve: Curves.linear);

              context.read<MainViewCubit>().onPageChange(value);
            },
            useLegacyColorScheme: true,
            elevation: 3,
            backgroundColor: Theme.of(context).colorScheme.primary,
            selectedIconTheme: IconThemeData(
              color: Theme.of(context).colorScheme.secondary,
            ),
            unselectedIconTheme: IconThemeData(
              color: Theme.of(context).colorScheme.background,
            ),
            selectedItemColor: Theme.of(context).colorScheme.secondary,
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
                  icon: InkWell(
                    onTap: () => showSettingDialog(context),
                    child: Icon(
                      TablerIcons.settings,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  tooltip: "Settings",
                  label: "Settings")
            ]);
      },
    );
  }
}
