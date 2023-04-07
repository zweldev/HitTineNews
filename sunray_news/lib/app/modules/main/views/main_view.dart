import 'package:flutter/material.dart';
import 'package:splash_view/splash_view.dart';
import 'package:sunray_news/app/theme/theme_constants.dart';
import 'package:sunray_news/app/theme/theme_manager.dart';

import 'package:tabler_icons/tabler_icons.dart';

import '../../bookmark/view/bookmark_view.dart';
import '../../categories/view/categories_view.dart';
import '../../home/view/home_view.dart';
import '../../search/view/search_view.dart';

ThemeManager _themeManager = ThemeManager();

class MainView extends StatelessWidget {
  MainView({super.key});

  static String route = "/main_view";

  List<Widget> pages = [
    HomeView(),
    CategoriesView(),
    SearchView(),
    BookMarkView(),
  ];

  @override
  Widget build(BuildContext context) {
    return SplashView(
      logo: Image.asset("assets/images/sunray-news-logo.png"),
      backgroundColor: Theme.of(context).primaryColor,
      done: Done(
        curve: Curves.easeOut,
        animationDuration: Duration(milliseconds: 200),
        Scaffold(
          body: PageView.builder(
            itemCount: pages.length,
            itemBuilder: (context, i) => pages[i],
          ),
          bottomNavigationBar: Theme(
            data: lightTheme,
            child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(
                        TablerIcons.news,
                      ),
                      label: "Home"),
                  BottomNavigationBarItem(
                      icon: Icon(TablerIcons.category), label: "Categories"),
                  BottomNavigationBarItem(
                      icon: Icon(TablerIcons.search), label: "Search"),
                  BottomNavigationBarItem(
                      icon: Icon(TablerIcons.bookmark), label: "Bookmark"),
                ]),
          ),
        ),
      ),
    );
  }
}
