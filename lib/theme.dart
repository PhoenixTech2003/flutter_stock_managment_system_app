import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData appThemeData(BuildContext context) {
    return ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF13232c),
            primary: const Color(0xFFA2C9FF),
            primaryContainer: const Color(0xFF2f4156),
            onPrimaryContainer: const Color(0xFFd7e2ff),
            surface: const Color(0xFF13232c),
            onSurface: const Color(0xffe0f1ff),
            onSurfaceVariant: const Color(0xffa8adbd)),
        useMaterial3: true);
  }
}
