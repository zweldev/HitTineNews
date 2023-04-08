import 'package:flutter/material.dart';
import 'package:sunray_news/app/modules/main/widgets/setting_tile.dart';
import 'package:sunray_news/app/widgets/custom_button.dart';

class SettingDialog extends StatelessWidget {
  const SettingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      insetPadding: EdgeInsets.zero,
      title: Text("Settings"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SettingTile(
            text: "Language",
            trailing: Text("a"),
          ),
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
