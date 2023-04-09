import 'package:flutter/material.dart';

Widget themeSwitch(
    {required BuildContext context,
    required bool value,
    required ValueChanged<bool> onChanged}) {
  return Switch(
      activeColor: Theme.of(context).colorScheme.secondary,
      value: value,
      onChanged: onChanged);
}
