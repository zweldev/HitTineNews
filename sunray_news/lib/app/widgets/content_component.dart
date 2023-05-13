import 'package:flutter/material.dart';
import 'package:sunray_news/app/core/extensions/theme_extensions.dart';

class ContentComponent extends StatelessWidget {
  const ContentComponent(
      {super.key, required this.description, required this.content});

  final String description;
  final String content;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          description,
          style: context.bodyMedium
              .copyWith(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        // SizedBox(height: 10),
        Text(
          content,
          style: context.bodySmall,
        ),
      ],
    );
  }
}
