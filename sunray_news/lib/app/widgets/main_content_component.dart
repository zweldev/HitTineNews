import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sunray_news/app/core/extensions/theme_extensions.dart';

import 'content_component.dart';

class MainContentComponent extends StatelessWidget {
  MainContentComponent({
    super.key,
    required this.image,
  });

  String image;

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
              imageUrl: image,
              placeholder: (context, url) => Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).secondaryHeaderColor,
                ),
              ),
              errorWidget: (context, url, error) => Center(
                child: Column(
                  children: [Icon(Icons.error), Text("Image not Found")],
                ),
              ),
            ),
          ),
          ContentComponent(description: "", content: ""),
        ],
      ),
    );
  }
}
