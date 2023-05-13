import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:sunray_news/app/core/enum/categories.dart';
import 'package:sunray_news/app/core/extensions/theme_extensions.dart';
import 'package:sunray_news/app/modules/home/cubit/home_cubit.dart';

import 'article_card.dart';
import 'loading_indicator.dart';

class BodyComponent extends StatefulWidget {
  const BodyComponent({super.key, required this.cat});

  final Categories cat;

  @override
  State<BodyComponent> createState() => _BodyComponentState();
}

class _BodyComponentState extends State<BodyComponent> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeCubit>(context).getNews();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state.loading) {
          return Center(
            child: SizedBox(
              width: 25,
              height: 25,
              child: LoadingWidget(),
            ),
          );
        } else {
          return ListView.builder(
              itemCount: state.news!.length,
              itemBuilder: (context, i) {
                print("bodyComponent ${state.news![i].toJSON()}");
                return ArticleCard(
                  cat: widget.cat,
                  article: state.news![i],
                );
              });
        }
      },
    );
  }
}
