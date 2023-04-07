import 'package:flutter/material.dart';
import 'package:splash_view/splash_view.dart';
import 'package:sunray_news/app/theme/theme_constants.dart';
import 'package:sunray_news/app/theme/theme_manager.dart';

import 'package:tabler_icons/tabler_icons.dart';

import '../../bookmark/view/bookmark_view.dart';
import '../../categories/view/categories_view.dart';
import '../../home/view/home_view.dart';
import '../../search/view/search_view.dart';
import '../../settings/view/setting_view.dart';

ThemeManager _themeManager = ThemeManager();
PageController _pageController = PageController();

class MainView extends StatefulWidget {
  MainView({super.key});

  static String route = "/main_view";

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  List<Widget> pages = [
    HomeView(),
    CategoriesView(),
    SearchView(),
    BookMarkView(),
    SettingView(),
  ];

  int currentIndex = 3;

  @override
  Widget build(BuildContext context) {
    return SplashView(
      logo: Image.asset("assets/images/sunray-news-logo.png"),
      backgroundColor: Color.fromRGBO(27, 69, 113, 1),
      done: Done(
        curve: Curves.easeOut,
        animationDuration: Duration(milliseconds: 200),
        Scaffold(
          body: PageView.builder(
            physics: NeverScrollableScrollPhysics(),
            controller: _pageController,
            onPageChanged: (val) {
              print("Val is $val");
            },
            itemCount: pages.length,
            itemBuilder: (context, i) => pages[i],
          ),
          bottomNavigationBar: Theme(
            data: lightTheme,
            child: BottomNavigationBar(
                currentIndex: currentIndex,
                onTap: (value) {
                  _pageController.animateToPage(value,
                      duration: Duration(milliseconds: 200),
                      curve: Curves.linear);
                  if (!mounted) return;
                  setState(() {});
                },
                useLegacyColorScheme: true,
                elevation: 3,
                backgroundColor: Theme.of(context).colorScheme.primary,
                selectedIconTheme: IconThemeData(
                  color: Theme.of(context).colorScheme.secondary,
                ),
                unselectedIconTheme: IconThemeData(
                  color: Theme.of(context).colorScheme.secondary,
                ),
                selectedItemColor: Theme.of(context).colorScheme.secondary,
                selectedFontSize: 15,
                showUnselectedLabels: false,
                showSelectedLabels: true,
                type: BottomNavigationBarType.fixed,
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(
                        TablerIcons.news,
                      ),
                      label: "News"),
                  BottomNavigationBarItem(
                      icon: Icon(TablerIcons.category), label: "Categories"),
                  BottomNavigationBarItem(
                      icon: Icon(TablerIcons.search), label: "Search"),
                  BottomNavigationBarItem(
                      icon: Icon(TablerIcons.bookmark), label: "Bookmark"),
                  BottomNavigationBarItem(
                      icon: Icon(TablerIcons.settings), label: "Settings"),
                ]),
          ),
        ),
      ),
    );
  }
}
