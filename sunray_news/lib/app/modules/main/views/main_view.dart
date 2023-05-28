import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_view/splash_view.dart';
import '../../auth/cubit/auth_cubit.dart';
import '../../bookmark/view/bookmark_view.dart';
import '../../home/view/home_view.dart';
import '../../search/view/search_view.dart';
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
    log('user is ${BlocProvider.of<AuthCubit>(context).state.user}');
    return SafeArea(
      child: Scaffold(
        body: PageView.builder(
          physics: NeverScrollableScrollPhysics(),
          controller: _pageController,
          onPageChanged: (val) {},
          itemCount: pages.length,
          itemBuilder: (context, i) => pages[i],
        ),
        bottomNavigationBar:
            BottomNavBarComponent(pageController: _pageController),
      ),
    );
  }
}
