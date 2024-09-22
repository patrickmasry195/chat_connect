import 'package:chat_connect/helpers/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'app_theme_event.dart';
part 'app_theme_state.dart';

class AppThemeBloc extends Bloc<AppThemeEvent, AppThemeState> {
  AppThemeBloc() : super(AppThemeInitial()) {
    on<InitialEvent>(_onInitialEvent);
    on<LightEvent>(_onLightEvent);
    on<DarkEvent>(_onDarkEvent);
  }

  Future<void> _onInitialEvent(
      InitialEvent event, Emitter<AppThemeState> emit) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool isDarkMode = pref.getBool('isDarkMode') ?? false;

    if (isDarkMode) {
      emit(
        AppDarkTheme(
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            fontFamily: GoogleFonts.jockeyOne().fontFamily,
            appBarTheme: const AppBarTheme(backgroundColor: kPrimaryColor),
          ),
        ),
      );
    } else {
      emit(
        AppLightTheme(
          lightTheme: ThemeData(
            brightness: Brightness.light,
            fontFamily: GoogleFonts.jockeyOne().fontFamily,
            appBarTheme: const AppBarTheme(backgroundColor: kPrimaryColor),
          ),
        ),
      );
    }
  }

  Future<void> _onLightEvent(
      LightEvent event, Emitter<AppThemeState> emit) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setBool('isDarkMode', false);
    emit(
      AppLightTheme(
        lightTheme: ThemeData(
          brightness: Brightness.light,
          fontFamily: GoogleFonts.jockeyOne().fontFamily,
          appBarTheme: const AppBarTheme(backgroundColor: kPrimaryColor),
        ),
      ),
    );
  }

  Future<void> _onDarkEvent(
      DarkEvent event, Emitter<AppThemeState> emit) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setBool('isDarkMode', true);
    emit(
      AppDarkTheme(
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: GoogleFonts.jockeyOne().fontFamily,
          appBarTheme: const AppBarTheme(backgroundColor: kPrimaryColor),
        ),
      ),
    );
  }
}
