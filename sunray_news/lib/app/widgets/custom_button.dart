import 'package:flutter/material.dart';

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
          backgroundColor: isConfirm
              ? MaterialStatePropertyAll(
                  Theme.of(context).colorScheme.secondary)
              : MaterialStatePropertyAll(Colors.white),
        ),
        onPressed: onTap,
        child: Text(
          text,
          style: TextStyle(color: isConfirm ? Colors.white : Colors.black),
        ));
  }
}
