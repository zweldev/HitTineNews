import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sunray_news/app/core/enum/categories.dart';
import 'package:sunray_news/app/core/enum/language.dart';
import 'package:sunray_news/app/core/extensions/theme_extensions.dart';
import 'package:sunray_news/app/model/news_model.dart';
import 'package:sunray_news/app/widgets/bottom_content_component.dart';
import 'package:tabler_icons/tabler_icons.dart';

import 'article_cover_img.dart';
import 'content_component.dart';
import 'main_content_component.dart';

class ArticleCard extends StatelessWidget {
  ArticleCard({super.key, required this.cat, required this.article});

  NewsModel article;

  final Categories cat;
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
            ),
            BottomContentComponent()
          ],
        ),
      ),
    );
  }
}
