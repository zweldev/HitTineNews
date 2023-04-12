import 'package:flutter/material.dart';
import 'package:sunray_news/app/core/extensions/theme_extensions.dart';

import 'content_component.dart';

class MainContentComponent extends StatelessWidget {
  const MainContentComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      radius: 22,
      onTap: () {
        print("Gesture detected");
      },
      child: Column(
        children: [
          Container(
            width: context.width,
            height: 300,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/sunray-news-logo.png"))),
          ),
          ContentComponent(description: "", content: ""),
        ],
      ),
    );
  }
}
