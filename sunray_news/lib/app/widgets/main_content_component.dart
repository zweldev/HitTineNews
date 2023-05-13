import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sunray_news/app/core/extensions/theme_extensions.dart';
import 'package:sunray_news/app/widgets/loading_indicator.dart';

import 'content_component.dart';

class MainContentComponent extends StatelessWidget {
  MainContentComponent(
      {super.key,
      required this.image,
      required this.title,
      required this.content});

  String image;
  String title;
  String content;

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
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: image,
              placeholder: (context, url) => Center(
                child: SizedBox(
                  width: 30,
                  height: 30,
                  child: LoadingWidget(),
                ),
              ),
              errorWidget: (context, url, error) => Center(
                child: Column(
                  children: [Icon(Icons.error), Text("Image not Found")],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 5, left: 5),
            child: ContentComponent(description: title, content: content),
          ),
        ],
      ),
    );
  }
}
