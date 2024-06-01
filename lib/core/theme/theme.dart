import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme.g.dart';

@riverpod
ThemeData theme(ThemeRef ref) {
  return AppTheme.lightTheme;
}

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      fontFamily: 'Roboto',
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: Color(0xff3556AB),
        onPrimary: Colors.white,
        secondary: Color(0xff9EB031),
        onSecondary: Colors.red,
        error: Colors.red,
        onError: Colors.white,
        surface: Color(0xfff3f3f3),
        onSurface: Colors.black,
        tertiary: Color(0xff071D55),
      ),
    );
  }
}
