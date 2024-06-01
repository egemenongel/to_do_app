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
  static Color grey = const Color(0xff8d8d8d);
  static Color secondaryTextColor = const Color(0xff0d2972);
  static Color yellow = const Color(0xffF2C94C);
  static Color white = Colors.white;
  static Color black = Colors.black;
  static Color errorColor = Colors.red;

  static ThemeData get lightTheme {
    return ThemeData(
      fontFamily: 'Roboto',
      textTheme: TextTheme(
        titleLarge: TextStyle(
          color: white,
          fontWeight: FontWeight.w100,
          fontSize: 25,
          fontStyle: FontStyle.italic,
        ),
        titleMedium: TextStyle(
          color: yellow,
          fontWeight: FontWeight.w500,
          fontSize: 18,
        ),
        titleSmall: TextStyle(
          color: white,
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
        bodyMedium: TextStyle(
          color: tertiaryColor,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        bodySmall: TextStyle(
          color: secondaryTextColor,
          fontWeight: FontWeight.normal,
          fontSize: 12,
        ),
        displayLarge: TextStyle(
          color: black,
          fontWeight: FontWeight.w400,
          fontSize: 16,
        ),
        displayMedium: TextStyle(
          color: tertiaryColor,
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
        displaySmall: TextStyle(
          color: grey,
          fontWeight: FontWeight.w500,
          fontSize: 16,
          decoration: TextDecoration.lineThrough,
        ),
      ),
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
        titleTextStyle: TextStyle(
          color: white,
          fontSize: 24,
          fontWeight: FontWeight.w500,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(4),
            ),
            side: BorderSide(
              color: tertiaryColor,
            ),
          ),
          foregroundColor: tertiaryColor,
          padding: EdgeInsets.zero,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(6),
            ),
          ),
        ),
      ),
    );
  }
}
