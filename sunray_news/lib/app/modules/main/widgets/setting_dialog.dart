import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sunray_news/app/core/enum/language.dart';
import 'package:sunray_news/app/core/extensions/navigation_extensions.dart';
import 'package:sunray_news/app/modules/main/widgets/setting_tile.dart';
import 'package:sunray_news/app/theme/cubit/theme_cubit.dart';
import 'package:sunray_news/app/widgets/custom_button.dart';

import 'language_dropdown.dart';
import 'theme_switch.dart';

class SettingDialog extends StatefulWidget {
  SettingDialog({super.key});

  @override
  State<SettingDialog> createState() => _SettingDialogState();
}

class _SettingDialogState extends State<SettingDialog> {
  final List<Language> languages = [
    Language.English,
    Language.Chinese,
    Language.Myanmar
  ];

  String? selectedLanguage;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          insetPadding: EdgeInsets.symmetric(horizontal: 30),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Settings",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(height: 20),
                SettingTile(
                  text: "Language",
                  trailing: languageDropDown(
                    languages: languages,
                    onChanged: (val) {
                      context.read<ThemeCubit>().languageChange(val);
                    },
                    value: state.language,
                  ),
                ),
                SizedBox(height: 20),
                SettingTile(
                  text: "Dark Theme",
                  trailing: themeSwitch(
                      context: context,
                      onChanged: (e) {
                        context.read<ThemeCubit>().themeChange(e);
                        print("Button e is $e");
                      },
                      value: state.themeMode == ThemeMode.dark ? true : false),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        onTap: () {
                          context.pop();
                        },
                        isConfirm: false,
                        text: "Cancel",
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: CustomButton(
                        onTap: () {
                          context.pop();
                        },
                        isConfirm: true,
                        text: "Confirm",
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

/**
 * 
 */