import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sunray_news/app/theme/theme_manager.dart';

import '../../core/enum/language.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit()
      : super(ThemeState(
            themeMode: ThemeManager.instance.themeMode,
            language: Language.English));

  void themeChange(bool isDark) {
    emit(state.copyWith(
      themeMode: ThemeManager.instance.toggleTheme(isDark),
    ));
  }

  void languageChange(Language language) {
    emit(state.copyWith(language: language));
  }
}
