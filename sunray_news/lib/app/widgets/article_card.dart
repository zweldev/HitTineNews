import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sunray_news/app/core/extensions/theme_extensions.dart';
import 'package:sunray_news/app/widgets/bottom_content_component.dart';
import 'package:tabler_icons/tabler_icons.dart';

import 'article_cover_img.dart';
import 'content_component.dart';
import 'main_content_component.dart';

class ArticleCard extends StatelessWidget {
  const ArticleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: Card(
        color: context.theme.colorScheme.background,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MainContentComponent(),
            SizedBox(height: 10),
            BottomContentComponent()
          ],
        ),
      ),
    );
  }
}


