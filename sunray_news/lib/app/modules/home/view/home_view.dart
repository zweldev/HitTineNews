import 'package:flutter/material.dart';
import 'package:sunray_news/app/core/extensions/theme_extensions.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  static String route = "/home_view";
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: TabBar(
                dividerColor: Colors.transparent,
                indicatorPadding: EdgeInsets.zero,
                indicatorColor: context.secondaryColor,
                isScrollable: true,
                labelColor: context.secondaryColor,
                labelStyle: context.bodyMedium,
                tabs: [
                  Tab(
                    text: "Top Headlines",
                  ),
                  Tab(
                    text: "Business",
                  ),
                  Tab(
                    text: "Technology",
                  ),
                  Tab(
                    text: "Entertainment",
                  ),
                  Tab(
                    text: "Sports",
                  ),
                  Tab(
                    text: "Science",
                  ),
                  Tab(
                    text: "Health",
                  ),
                ])),
        body: Container(
          color: context.secondaryColor,
        ),
      ),
    );
  }
}
