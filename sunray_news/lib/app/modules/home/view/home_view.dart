import 'package:flutter/material.dart';
import 'package:sunray_news/app/core/enum/categories.dart';
import 'package:sunray_news/app/core/extensions/theme_extensions.dart';
import 'package:sunray_news/app/widgets/article_card.dart';
import 'package:sunray_news/app/widgets/body_component.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  static String route = "/home_view";
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      initialIndex: 0,
      child: Scaffold(
          body: NestedScrollView(
              floatHeaderSlivers: true,
              headerSliverBuilder: (context, index) {
                return [
                  SliverAppBar(
                    backgroundColor: Colors.transparent,
                    flexibleSpace: Container(
                      color: context.theme.colorScheme.primary,
                      child: TabBar(
                          padding: EdgeInsets.zero,
                          dividerColor: Colors.transparent,
                          indicatorPadding: EdgeInsets.zero,
                          indicatorColor: context.secondaryColor,
                          indicatorSize: TabBarIndicatorSize.tab,
                          isScrollable: true,
                          labelColor: context.theme.colorScheme.secondary,
                          unselectedLabelColor:
                              context.theme.colorScheme.onBackground,
                          labelStyle: context.bodyMedium
                              .copyWith(fontWeight: FontWeight.bold),
                          tabs: Categories.values
                              .map((e) => Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Tab(
                                      child: Text(
                                        e.toString().substring(11),
                                      ),
                                    ),
                                  ))
                              .toList()),
                    ),
                  ),
                ];
              },
              body: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: Categories.values
                      .map((e) => BodyComponent(cat: e))
                      .toList()))),
    );
  }
}
