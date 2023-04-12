import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sunray_news/app/core/enum/categories.dart';

import 'article_card.dart';

class BodyComponent extends StatelessWidget {
  const BodyComponent({super.key, required this.cat});

  final Categories cat;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 30,
      itemBuilder: (context, index) => ArticleCard(
        cat: cat,
      ),
    );
  }
}
