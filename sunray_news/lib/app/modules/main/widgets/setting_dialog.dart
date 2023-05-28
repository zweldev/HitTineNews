import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sunray_news/app/core/enum/language.dart';
import 'package:sunray_news/app/core/extensions/theme_extensions.dart';
import 'package:sunray_news/app/modules/main/widgets/setting_tile.dart';
import 'package:sunray_news/app/theme/cubit/theme_cubit.dart';

import '../../auth/view/auth_options_view.dart';
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
          backgroundColor: context.theme.colorScheme.primary,
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
                    context: context,
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
                SettingTile(
                    text: "Logout",
                    trailing: FilledButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.grey.shade200)),
                        onPressed: () async {
                          final SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          await FirebaseAuth.instance.signOut();
                          prefs.remove('userdata');
                          Navigator.of(context).pushNamedAndRemoveUntil(
                            AuthOptionView.route,
                            (route) => false,
                          );
                          // Navigator.of(context).pop();
                        },
                        child: Icon(
                          Icons.logout,
                          color: Colors.red,
                        ))),
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