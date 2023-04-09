import 'package:flutter/material.dart';
import 'package:sunray_news/app/core/enum/categories.dart';
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
                              context.theme.colorScheme.surface,
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
                  children: Categories.values
                      .map((e) => ListView.builder(
                            itemCount: 30,
                            itemBuilder: (context, index) => ListTile(
                              title: Text("1"),
                            ),
                          ))
                      .toList()))),
    );
  }
}

/**
 * TabBarView(
                      children: Categories.values
                          .map((e) => Container(
                                child: Center(
                                  child: Text(e.name.toString()),
                                ),
                              ))
                          .toList())
 */

/**
 * CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              floating: true,
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
                    unselectedLabelColor: context.theme.colorScheme.surface,
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
            SliverList(
              delegate: SliverChildListDelegate([
                SliverToBoxAdapter(
                  child: Container(),
                )
              ]),
            )
          ],
        ),
 */