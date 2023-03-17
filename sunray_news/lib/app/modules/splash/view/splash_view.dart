import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hit_tine_news/app/core/extensions/navigation_extensions.dart';
import 'package:hit_tine_news/app/modules/home/view/home_view.dart';

class SplashView extends StatefulWidget {
  SplashView({super.key});

  static String route = "/splash_view";

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Timer(
        const Duration(
          seconds: 3,
        ),
        () => 
          context.pushReplacementNamed(HomeView.route),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(
        child: Container(
          width: 150,
          height: 150,
          color: Colors.red,
        ),
      ),
    );
  }
}
