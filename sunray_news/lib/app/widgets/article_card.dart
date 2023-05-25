import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sunray_news/app/core/enum/categories.dart';
import 'package:sunray_news/app/core/extensions/theme_extensions.dart';
import 'package:sunray_news/app/model/news_model.dart';
import 'package:sunray_news/app/widgets/bottom_content_component.dart';

import 'main_content_component.dart';

class ArticleCard extends StatelessWidget {
  ArticleCard({super.key, required this.article});

  NewsModel article;
  @override
  Widget build(BuildContext context) {
    print('article is ${article.urlToImg}');
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: Card(
        color: context.theme.colorScheme.background,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MainContentComponent(
              image: article.urlToImg.toString(),
              title: article.title,
              content: article.content ?? '',
              urlToContent: article.url ?? '',
              source: article.source.name ?? '',
            ),
            BottomContentComponent(
              dateTime: article.publishedAt,
              source: article.source.name,
            )
          ],
        ),
      ),
    );
  }
}
