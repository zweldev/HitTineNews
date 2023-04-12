import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sunray_news/app/core/extensions/theme_extensions.dart';
import 'package:tabler_icons/tabler_icons.dart';

class BottomContentComponent extends StatelessWidget {
  const BottomContentComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Source dateTime",
            style: context.bodySmall.copyWith(color: Colors.grey),
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
