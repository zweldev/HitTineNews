import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sunray_news/app/core/extensions/theme_extensions.dart';
import 'package:tabler_icons/tabler_icons.dart';

class BottomContentComponent extends StatelessWidget {
  const BottomContentComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 7.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [Text("Engadget"), Text("1 week ago")],
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    TablerIcons.book,
                    color: context.theme.colorScheme.secondary,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(TablerIcons.share,
                      color: context.theme.colorScheme.secondary)),
            ],
          )
        ],
      ),
    );
  }
}
