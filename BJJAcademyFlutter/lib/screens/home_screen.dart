import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../models/belt.dart';
import '../services/app_state.dart';
import '../widgets/app_scaffold.dart';
import '../widgets/belt_tile.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(appStateProvider);

    return AppScaffold(
      index: 0,
      child: LayoutBuilder(
        builder: (context, c) {
          final isCompact = c.maxWidth < 430;
          final horizontalPadding = isCompact ? 16.0 : 22.0;
          final actionColumns = c.maxWidth < 700 ? 2 : 4;

          return ListView(
            padding: EdgeInsets.fromLTRB(horizontalPadding, 12, horizontalPadding, 24),
            children: [
              Row(
                children: [
                  Image.asset('assets/icon/app_icon.png', width: isCompact ? 54 : 64, height: isCompact ? 54 : 64),
                  const SizedBox(width: 14),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FittedBox(
                          alignment: Alignment.centerLeft,
                          fit: BoxFit.scaleDown,
                          child: Text('BJJ Academy', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900)),
                        ),
                        Text('Domine. Estude. Evolua.'),
                      ],
                    ),
                  ),
                  IconButton.filledTonal(
                    onPressed: state.toggleTheme,
                    icon: Icon(state.themeMode == ThemeMode.dark ? Icons.light_mode : Icons.dark_mode),
                  ),
                ],
              ),
              const SizedBox(height: 22),
              TextField(
                readOnly: true,
                onTap: () => context.push('/search'),
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Buscar posição...',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
                ),
              ),
              const SizedBox(height: 22),
              GridView.count(
                crossAxisCount: actionColumns,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: isCompact ? 1.55 : 1.75,
                children: [
                  _HomeAction(icon: Icons.sports_martial_arts, title: 'Posições\npor faixa', onTap: () {}),
                  _HomeAction(icon: Icons.block, title: 'Proibidas\npor faixa', onTap: () => context.push('/rules')),
                  _HomeAction(icon: Icons.favorite, title: 'Favoritos', onTap: () => context.push('/favorites')),
                  _HomeAction(icon: Icons.menu_book, title: 'Regras', onTap: () => context.push('/rules')),
                ],
              ),
              const SizedBox(height: 24),
              const Text('Faixas', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900)),
              const SizedBox(height: 8),
              for (final belt in Belt.values) BeltTile(belt: belt),
            ],
          );
        },
      ),
    );
  }
}

class _HomeAction extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _HomeAction({required this.icon, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: Row(
            children: [
              Icon(icon, size: 30, color: Theme.of(context).colorScheme.primary),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 14, height: 1.05),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
