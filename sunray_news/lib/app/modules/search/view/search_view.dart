import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sunray_news/app/modules/search/cubit/search_news_cubit.dart';
import 'package:sunray_news/app/widgets/article_card.dart';
import 'package:sunray_news/app/widgets/loading_indicator.dart';

import '../widgets/search_field.dart';

class SearchView extends StatelessWidget {
  SearchView({super.key});
  final TextEditingController queryContoller = TextEditingController();
  final FocusNode fnode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(48.h),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 2,
                offset: Offset(0, 1),
              ),
            ],
          ),
          child: AppBar(
            backgroundColor: Theme.of(context).brightness == Brightness.dark
                ? Colors.black
                : Colors.white,
            title: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
              child: SearchField(
                controller: queryContoller,
                node: fnode,
                onSubmit: (e) {
                  log('query typed ${e}');
                  context.read<SearchNewsCubit>().search(query: e);
                },
              ),
            ),
          ),
        ),
      ),
      body: BlocBuilder<SearchNewsCubit, SearchNewsState>(
        builder: (context, state) {
          if (state.loading) {
            return Center(
              child: SizedBox(
                width: 25,
                height: 25,
                child: LoadingWidget(),
              ),
            );
          }

          return ListView.builder(
            itemCount: state.articles.length,
            itemBuilder: (context, i) =>
                ArticleCard(article: state.articles[i]),
          );
        },
      ),
    );
  }
}
