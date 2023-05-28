import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../auth/cubit/auth_cubit.dart';
import '../../bookmark/view/bookmark_view.dart';
import '../../home/view/home_view.dart';
import '../../search/view/search_view.dart';
import '../widgets/bottom_nav_bar.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fluttertoast/fluttertoast.dart';

PageController _pageController = PageController();

class MainView extends StatefulWidget {
  MainView({super.key});
  static String route = "/main_view";

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final Connectivity _connectivity = Connectivity();

  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  List<Widget> pages = [
    HomeView(),
    SearchView(),
    BookMarkView(),
  ];

  @override
  void initState() {
    super.initState();
    Timer.periodic(
      Duration(seconds: 5),
      (w) {
        _connectivity.onConnectivityChanged.listen((event) {
          updateConnectionStatus(event);
         
        });
         log('connectivity status ${_connectionStatus}');
        // showToast();
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _connectivitySubscription.cancel();
  }

  Future<void> updateConnectionStatus(ConnectivityResult result) async {
    setState(() {
      _connectionStatus = result;
    });
  }

  void showToast() async {
    _connectivity.onConnectivityChanged.listen((event) {
      event == ConnectivityResult.none
          ? Fluttertoast.showToast(msg: 'NO INTERNET')
          : null;
    });
  }

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
