import 'dart:async';
import 'package:flutter/material.dart';
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

  ConnectivityResult _connectionStatus = ConnectivityResult.wifi;
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
      Duration(seconds: 10),
      (w) {
        _connectivity.onConnectivityChanged.listen((event) {
          updateConnectionStatus(event);
        });
        _connectionStatus == ConnectivityResult.none ? showToast() : null;
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
    await Fluttertoast.showToast(
        msg: 'Bad Network connection',
        textColor: Colors.white,
        backgroundColor: Colors.red);
  }

  int currentIndex = 3;

  @override
  Widget build(BuildContext context) {
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
