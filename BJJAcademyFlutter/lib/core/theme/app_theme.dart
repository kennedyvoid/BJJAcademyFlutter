import 'package:flutter/material.dart';

class AppTheme {
  static const gold = Color(0xFFD6A536);
  static ThemeData dark() => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(seedColor: gold, brightness: Brightness.dark),
        scaffoldBackgroundColor: const Color(0xFF080808),
        cardTheme: CardThemeData(color: const Color(0xFF171717), elevation: 0, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22))),
      );
  static ThemeData light() => ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(seedColor: gold, brightness: Brightness.light),
        scaffoldBackgroundColor: const Color(0xFFF7F6F2),
        cardTheme: CardThemeData(color: Colors.white, elevation: 0, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22))),
      );
}
