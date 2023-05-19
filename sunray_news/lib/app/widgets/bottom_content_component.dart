import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sunray_news/app/core/extensions/theme_extensions.dart';
import 'package:tabler_icons/tabler_icons.dart';

class BottomContentComponent extends StatelessWidget {
  const BottomContentComponent(
      {super.key, required this.source, required this.dateTime});

  final String source;
  final String dateTime;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                source,
                style: context.bodySmall.copyWith(color: Colors.grey),
              ),
              SizedBox(width: 10),
              Text(
                dateTime.split('T').first,
                style: context.bodySmall.copyWith(color: Colors.grey),
              ),
            ],
          ),
          Row(
            children: [
              IconButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          context.theme.colorScheme.surface)),
                  onPressed: () {},
                  icon: Icon(
                    TablerIcons.download,
                    color: context.theme.colorScheme.onSecondary,
                  )),
              IconButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          context.theme.colorScheme.surface)),
                  onPressed: () {},
                  icon: Icon(TablerIcons.share,
                      color: context.theme.colorScheme.onSecondary)),
            ],
          )
        ],
      ),
    );
  }
}
