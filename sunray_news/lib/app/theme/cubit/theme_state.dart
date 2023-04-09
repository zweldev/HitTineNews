// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'theme_cubit.dart';

class ThemeState extends Equatable {
  ThemeState({required this.themeMode, required this.language});

  final ThemeMode themeMode;
  final Language language;

  @override
  List<Object> get props => [themeMode, language];

  ThemeState copyWith({
    ThemeMode? themeMode,
    Language? language,
  }) {
    return ThemeState(
      themeMode: themeMode ?? this.themeMode,
      language: language ?? this.language,
    );
  }
}
