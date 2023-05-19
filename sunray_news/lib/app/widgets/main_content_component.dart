import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:sunray_news/app/core/extensions/theme_extensions.dart';
import 'package:sunray_news/app/widgets/article_webview.dart';
import 'package:sunray_news/app/widgets/loading_indicator.dart';

import 'content_component.dart';

class MainContentComponent extends StatelessWidget {
  MainContentComponent({
    super.key,
    required this.image,
    required this.title,
    required this.content,
    required this.urlToContent,
  });
  String image;
  String title;
  String content;
  String urlToContent;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      radius: 22,
      onTap: () {
        Navigator.of(context).pushNamed(ArticleWebView.route, arguments: urlToContent);
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
                child: Container(
                  width: double.infinity,
                  color: Colors.grey[300],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Icon(Icons.error), Text("Image not Found")],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 5, left: 5),
            child: ContentComponent(
                description: title, content: content),
          ),
        ],
      ),
    );
  }
}
