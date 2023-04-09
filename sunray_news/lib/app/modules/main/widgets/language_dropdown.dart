import 'package:flutter/material.dart';
import 'package:sunray_news/app/core/enum/language.dart';

Widget languageDropDown(
    {required List<Language> languages,
    String? value,
    required ValueChanged onChanged}) {
  return DropdownButton(
    
      isDense: true,
      hint: Text("Select Language"),
      value: value,
      items: languages
          .map((e) => DropdownMenuItem(value: e, child: Text(e.toString())))
          .toList(),
      onChanged: onChanged);
}
