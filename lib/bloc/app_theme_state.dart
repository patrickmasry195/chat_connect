part of 'app_theme_bloc.dart';

@immutable
sealed class AppThemeState {}

final class AppThemeInitial extends AppThemeState {}

final class AppLightTheme extends AppThemeState {
  final ThemeData lightTheme;

  AppLightTheme({required this.lightTheme});
}

final class AppDarkTheme extends AppThemeState {
  final ThemeData darkTheme;

  AppDarkTheme({required this.darkTheme});
}
