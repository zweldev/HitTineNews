import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sunray_news/app/core/extensions/theme_extensions.dart';

class ContentComponent extends StatelessWidget {
  const ContentComponent(
      {super.key, required this.description, required this.content});

  final String description;
  final String content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        children: [
          Text(
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            "Lorem Ipsum Dolor Sit Amet bar Nyar pop kwr Lorem Nyar pop kwr Lorem Ipsum Dolor Sit Amet bar Nyar pop kwr",
            style: context.bodyMedium
                .copyWith(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(height: 10),
          Text(
            "Lorem Ipsum Dolor Sit Amet bar Nyar pop kwr Lorem Ipsum Dolor Sit Amet bar Nyar pop kwrLorem Ipsum Dolor Sit Amet bar Nyar pop kwrLorem Ipsum Dolor Sit Amet bar Nyar pop kwrLorem Ipsum Dolor Sit Amet bar Nyar pop kwr",
            style: context.bodySmall,
          ),
        ],
      ),
    );
  }
}
