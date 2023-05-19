import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:sunray_news/app/core/extensions/theme_extensions.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LoadingIndicator(
      
      colors: [context.secondaryColor, Colors.blue],
      indicatorType: Indicator.lineScale,
    );
  }
}
