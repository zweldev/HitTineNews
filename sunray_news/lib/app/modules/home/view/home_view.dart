import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  static String route = "/home_view";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sun Ray",
          style: TextStyle(
            fontFamily: 'Delicious',
          ),
        ),
      ),
    );
  }
}
