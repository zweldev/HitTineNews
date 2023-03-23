import 'package:flutter/material.dart';
import 'package:hit_tine_news/app/modules/bookmark/view/bookmark_view.dart';
import 'package:hit_tine_news/app/modules/home/view/home_view.dart';
import 'package:hit_tine_news/app/modules/search/view/search_view.dart';
import 'package:tabler_icons/tabler_icons.dart';

class MainView extends StatelessWidget {
  MainView({super.key});

  static String route = "/main_view";

  List<Widget> pages = [
    HomeView(),
    SearchView(),
    BookMarkView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: pages.length,
        itemBuilder: (context, i) => pages[i],
      ),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon: Icon(TablerIcons.news), label: "Home"),
        BottomNavigationBarItem(
            icon: Icon(TablerIcons.search), label: "Search"),
        BottomNavigationBarItem(
            icon: Icon(TablerIcons.bookmark), label: "Bookmark"),
      ]),
    );
  }
}
