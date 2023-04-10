import 'package:flutter/material.dart';
import 'package:sunray_news/app/core/extensions/theme_extensions.dart';

import 'content_component.dart';

class MainContentComponent extends StatelessWidget {
  const MainContentComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Gesture detected");
      },
      child: Column(
        children: [
          // imageComponent("null"),
          Container(
            width: context.width,
            height: 300,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        "assets/images/sunray-news-logo.png"))),
          ),
          SizedBox(height: 10),
          ContentComponent(description: "", content: ""),
        ],
      ),
    );
  }
}