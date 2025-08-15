import 'package:flutter/material.dart';
import 'constants.dart';

class AppTheme {
  // Light theme
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: PRIMARY_COLOR,
      secondary: SECONDARY_COLOR,
      brightness: Brightness.light,
    ),
    scaffoldBackgroundColor: LIGHT_BACKGROUND,
    appBarTheme: AppBarTheme(
      backgroundColor: PRIMARY_COLOR,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: PRIMARY_COLOR,
        foregroundColor: Colors.white,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        color: Colors.black87,
      ),
    ),
  );

  // Dark theme
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: PRIMARY_COLOR,
      secondary: SECONDARY_COLOR,
      brightness: Brightness.dark,
    ),
    scaffoldBackgroundColor: DARK_BACKGROUND,
    appBarTheme: AppBarTheme(
      backgroundColor: DARK_SURFACE,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: PRIMARY_COLOR,
        foregroundColor: Colors.white,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        color: Colors.white,
      ),
    ),
  );
}
