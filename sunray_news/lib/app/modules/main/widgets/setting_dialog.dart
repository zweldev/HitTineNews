import 'package:flutter/material.dart';
import 'package:sunray_news/app/core/enum/language.dart';
import 'package:sunray_news/app/modules/main/widgets/setting_tile.dart';
import 'package:sunray_news/app/widgets/custom_button.dart';

import 'language_dropdown.dart';

class SettingDialog extends StatelessWidget {
  SettingDialog({super.key});

  final List<Language> languages = [
    Language.English,
    Language.Chinese,
    Language.Myanmar
  ];

  String? selectedLanguage;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      // insetPadding: EdgeInsets.zero,
      title: Text("Settings"),

      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SettingTile(
            text: "Language",
            trailing: languageDropDown(
              languages: languages,
              onChanged: (val) {
                selectedLanguage = val.toString();
              },
              value: selectedLanguage,
            ),
          ),
          SizedBox(height: 20),
          SettingTile(
            text: "Theme",
            trailing: Text("a"),
          ),
        ],
      ),
      actions: [
        Row(
          children: [
            Expanded(
              child: CustomButton(
                onTap: () {},
                isConfirm: false,
                text: "Cancel",
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: CustomButton(
                onTap: () {},
                isConfirm: true,
                text: "Confirm",
              ),
            ),
          ],
        )
      ],
    );
  }
}
