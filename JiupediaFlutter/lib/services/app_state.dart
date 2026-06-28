import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final appStateProvider = ChangeNotifierProvider<AppState>((ref) => AppState()..load());

class AppState extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;
  final Set<String> favorites = {};

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    themeMode = (prefs.getBool('dark') ?? true) ? ThemeMode.dark : ThemeMode.light;
    favorites.addAll(prefs.getStringList('favorites') ?? []);
    notifyListeners();
  }

  Future<void> toggleTheme() async {
    themeMode = themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('dark', themeMode == ThemeMode.dark);
    notifyListeners();
  }

  Future<void> toggleFavorite(String id) async {
    favorites.contains(id) ? favorites.remove(id) : favorites.add(id);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('favorites', favorites.toList());
    notifyListeners();
  }

  bool isFavorite(String id) => favorites.contains(id);
}
