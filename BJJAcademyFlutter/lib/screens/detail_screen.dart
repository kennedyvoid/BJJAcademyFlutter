import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/bjj_position.dart';
import '../services/app_state.dart';

class DetailScreen extends ConsumerWidget {
  final BjjPosition position;
  const DetailScreen({super.key, required this.position});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(appStateProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(position.name), centerTitle: true,
        actions: [IconButton(onPressed: () => state.toggleFavorite(position.id), icon: Icon(state.isFavorite(position.id) ? Icons.star : Icons.star_border))],
      ),
      body: SafeArea(child: ListView(padding: const EdgeInsets.all(16), children: [
        ClipRRect(borderRadius: BorderRadius.circular(22), child: AspectRatio(aspectRatio: 1.45, child: Image.asset(position.image, fit: BoxFit.cover))),
        const SizedBox(height: 20),
        Text(position.name, style: const TextStyle(fontSize: 34, fontWeight: FontWeight.w900)),
        const SizedBox(height: 8),
        Text(position.description, style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: 18),
        Wrap(spacing: 10, runSpacing: 10, children: [
          _Info(label: 'Faixa', value: position.belt.label),
          _Info(label: 'Pontos', value: position.points.toString()),
          _Info(label: 'Status', value: position.status),
        ]),
        const SizedBox(height: 18),
        _Section(title: 'Critérios', items: position.criteria),
        const SizedBox(height: 14),
        _Section(title: 'Erros comuns', items: position.commonMistakes),
      ])),
    );
  }
}

class _Info extends StatelessWidget { final String label; final String value; const _Info({required this.label, required this.value}); @override Widget build(BuildContext context)=>Container(width: 150, padding: const EdgeInsets.all(16), decoration: BoxDecoration(color: Theme.of(context).cardColor, borderRadius: BorderRadius.circular(18)), child: Column(children: [Text(label, style: const TextStyle(color: Colors.grey)), const SizedBox(height: 6), Text(value, textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 18))])); }
class _Section extends StatelessWidget { final String title; final List<String> items; const _Section({required this.title, required this.items}); @override Widget build(BuildContext context)=>Card(child: Padding(padding: const EdgeInsets.all(16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w900)), const SizedBox(height: 10), for (var i=0;i<items.length;i++) Padding(padding: const EdgeInsets.symmetric(vertical: 6), child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [CircleAvatar(radius: 14, child: Text('${i+1}')), const SizedBox(width: 10), Expanded(child: Text(items[i], style: const TextStyle(fontSize: 16)))]))]))); }
