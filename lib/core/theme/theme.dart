import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme.g.dart';

@riverpod
ThemeData theme(ThemeRef ref) {
  return AppTheme.lightTheme;
}

class AppTheme {
  static Color primaryColor = const Color(0xff3556AB);
  static Color secondaryColor = const Color(0xffCDE53D);
  static Color tertiaryColor = const Color(0xff071D55);
  static Color surfaceColor = const Color(0xfff3f3f3);
  static Color white = Colors.white;
  static Color black = Colors.black;
  static Color errorColor = Colors.red;

  static ThemeData get lightTheme {
    return ThemeData(
      fontFamily: 'Roboto',
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: primaryColor,
        onPrimary: white,
        secondary: secondaryColor,
        onSecondary: white,
        error: errorColor,
        onError: white,
        surface: surfaceColor,
        onSurface: black,
        tertiary: tertiaryColor,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: primaryColor,
        foregroundColor: white,
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
                borderRadius: const BorderRadius.all(
                  Radius.circular(4),
                ),
                side: BorderSide(
                  color: tertiaryColor,
                )),
          ),
        ),
      ),
    );
  }
}
