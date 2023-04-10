import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sunray_news/app/core/extensions/theme_extensions.dart';
import 'package:tabler_icons/tabler_icons.dart';

CachedNetworkImage imageComponent(String url) {
  return CachedNetworkImage(
    progressIndicatorBuilder: (context, url, progress) => CircularProgressIndicator(
      color: context.theme.colorScheme.secondary,
    ),
      errorWidget: (context, url, error) => Center(
            child: Icon(TablerIcons.error_404),
          ),
      imageUrl: url);
}
