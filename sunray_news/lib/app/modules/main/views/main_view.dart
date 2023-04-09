import 'package:flutter/material.dart';
import 'package:splash_view/splash_view.dart';
import 'package:sunray_news/app/theme/theme_constants.dart';
import 'package:sunray_news/app/theme/theme_manager.dart';

import 'package:tabler_icons/tabler_icons.dart';

import '../../bookmark/view/bookmark_view.dart';
import '../../home/view/home_view.dart';
import '../../search/view/search_view.dart';
import '../../settings/view/setting_view.dart';
import '../widgets/bottom_nav_bar.dart';

PageController _pageController = PageController();

class MainView extends StatelessWidget {
  MainView({super.key});

  static String route = "/main_view";

  List<Widget> pages = [
    HomeView(),
    SearchView(),
    BookMarkView(),
  ];

  int currentIndex = 3;

  @override
  Widget build(BuildContext context) {
    return SplashView(
      logo: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Image.asset("assets/images/sunray-news-logo.png"),
      ),
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
          bottomNavigationBar: BottomNavBarComponent(pageController: _pageController),
        ),
      ),
    );
  }
}
