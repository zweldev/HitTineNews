import 'package:flutter/material.dart';
import 'package:sunray_news/app/core/extensions/theme_extensions.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onTap,
    required this.text,
    required this.isConfirm,
  });

  final VoidCallback onTap;
  final String text;
  final bool isConfirm;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStatePropertyAll(3),
          shadowColor: MaterialStatePropertyAll(Colors.grey),
          backgroundColor: isConfirm
              ? MaterialStatePropertyAll(
                  context.theme.colorScheme.onSecondary,
                )
              : MaterialStatePropertyAll(Colors.white),
        ),
        onPressed: onTap,
        child: Text(
          text,
          style: TextStyle(
              color: isConfirm ? Colors.white : Color.fromRGBO(27, 69, 113, 1)),
        ));
  }
}
