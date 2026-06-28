import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'core/theme/app_theme.dart';
import 'data/app_data.dart';
import 'models/belt.dart';
import 'services/app_state.dart';
import 'screens/home_screen.dart';
import 'screens/belt_screen.dart';
import 'screens/detail_screen.dart';
import 'screens/search_screen.dart';
import 'screens/favorites_screen.dart';
import 'screens/rules_screen.dart';

void main() => runApp(const ProviderScope(child: JiupediaApp()));

final router = GoRouter(routes: [
  GoRoute(path: '/', builder: (_, __) => const HomeScreen()),
  GoRoute(path: '/search', builder: (_, __) => const SearchScreen()),
  GoRoute(path: '/favorites', builder: (_, __) => const FavoritesScreen()),
  GoRoute(path: '/rules', builder: (_, __) => const RulesScreen()),
  GoRoute(path: '/belt/:belt', builder: (_, s) => BeltScreen(belt: Belt.values.firstWhere((b) => b.name == s.pathParameters['belt']))),
  GoRoute(path: '/position/:id', builder: (_, s) => DetailScreen(position: positions.firstWhere((p) => p.id == s.pathParameters['id']))),
]);

class JiupediaApp extends ConsumerWidget {
  const JiupediaApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(appStateProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Jiupedia',
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: state.themeMode,
      routerConfig: router,
    );
  }
}
