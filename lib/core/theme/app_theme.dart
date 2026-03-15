import 'package:flutter/material.dart';

class AppTheme {
  static const _seed = Color(0xFF6C4DFF);

  static ThemeData get lightTheme {
    final scheme = ColorScheme.fromSeed(seedColor: _seed, brightness: Brightness.light);
    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: const Color(0xFFF7F7FF),
      appBarTheme: const AppBarTheme(centerTitle: true),
      cardTheme: const CardThemeData(elevation: 0),
      inputDecorationTheme: const InputDecorationTheme(border: OutlineInputBorder()),
    );
  }

  static ThemeData get darkTheme {
    final scheme = ColorScheme.fromSeed(seedColor: _seed, brightness: Brightness.dark);
    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: const Color(0xFF0D1025),
      appBarTheme: const AppBarTheme(centerTitle: true),
      cardTheme: const CardThemeData(elevation: 0),
      inputDecorationTheme: const InputDecorationTheme(border: OutlineInputBorder()),
    );
  }
}
