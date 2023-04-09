import 'package:flutter/material.dart';
import 'package:sunray_news/app/core/enum/language.dart';
import 'package:sunray_news/app/core/extensions/theme_extensions.dart';

Widget languageDropDown(
    {required BuildContext context,
    required List<Language> languages,
    Language? value,
    required ValueChanged onChanged}) {
  return Container(
    color: Colors.transparent,
    child: DropdownButton(
        style: context.bodyMedium,
        underline: SizedBox(),
        isDense: true,
        hint: Text("Select Language"),
        dropdownColor: context.theme.colorScheme.primary,
        value: value,
        items: languages
            .map((e) => DropdownMenuItem(
                value: e,
                child: Text(
                  e.toString().substring(9),
                  style: context.bodyMedium,
                )))
            .toList(),
        onChanged: onChanged),
  );
}
