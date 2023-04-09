import 'package:flutter/material.dart';

class SettingTile extends StatelessWidget {
  const SettingTile({super.key, required this.text, required this.trailing});

  final String text;
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(fontSize: 15),
        ),
        trailing
      ],
    );
  }
}

/**
 * ListTile(
      
      title: Text(text),
      trailing: trailing,
    )
 */
