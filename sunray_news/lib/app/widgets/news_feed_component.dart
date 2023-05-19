
import 'package:flutter/material.dart';
import 'package:sunray_news/app/core/enum/categories.dart';

import '../model/news_model.dart';
import 'article_card.dart';

class NewsFeedComponent extends StatelessWidget {
  NewsFeedComponent({super.key, required this.articles, required this.cat});

  List<NewsModel> articles;
  Categories cat;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, i) {
          // log("bodyComponent ${articles[i].toJSON()}");
          return ArticleCard( 
            article: articles[i],
          );
        });
  }
}
