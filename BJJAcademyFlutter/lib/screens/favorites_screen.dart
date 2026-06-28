import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/app_data.dart';
import '../services/app_state.dart';
import '../widgets/app_scaffold.dart';
import '../widgets/position_card.dart';

class FavoritesScreen extends ConsumerWidget { const FavoritesScreen({super.key}); @override Widget build(BuildContext context, WidgetRef ref){
  final favs = ref.watch(appStateProvider).favorites;
  final items = positions.where((p)=>favs.contains(p.id)).toList();
  return AppScaffold(index:2,title:'Favoritos',child: items.isEmpty ? const Center(child: Text('Nenhuma posição favoritada ainda.')) : LayoutBuilder(builder:(context,c){
    final columns = c.maxWidth < 360 ? 1 : c.maxWidth < 700 ? 2 : 3;
    return GridView.builder(padding: const EdgeInsets.all(16), gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: columns, crossAxisSpacing: 14, mainAxisSpacing:14, childAspectRatio: c.maxWidth < 360 ? 1.08 : .78), itemCount:items.length, itemBuilder:(_,i)=>PositionCard(position:items[i]));
  }));
}}
