import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sunray_news/app/modules/main/cubit/main_view_cubit.dart';
import 'package:tabler_icons/tabler_icons.dart';

class BottomNavBarComponent extends StatelessWidget {
  const BottomNavBarComponent({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainViewCubit, MainViewState>(
      builder: (context, state) {
        return BottomNavigationBar(
            currentIndex: state.currentPageIndex,
            onTap: (value) {
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
            showUnselectedLabels: false,
            showSelectedLabels: false,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    TablerIcons.news,
                  ),
                  tooltip: "News",
                  label: "News"),
              BottomNavigationBarItem(
                  icon: Icon(TablerIcons.category),
                  tooltip: "Categories",
                  label: "Categories"),
              BottomNavigationBarItem(
                  icon: Icon(TablerIcons.search),
                  tooltip: "Search",
                  label: "Search"),
              BottomNavigationBarItem(
                  icon: Icon(TablerIcons.bookmark),
                  tooltip: "Bookmark",
                  label: "Bookmark"),
              BottomNavigationBarItem(
                  icon: Icon(TablerIcons.settings),
                  tooltip: "Settings",
                  label: "Settings"),
            ]);
      },
    );
  }
}
