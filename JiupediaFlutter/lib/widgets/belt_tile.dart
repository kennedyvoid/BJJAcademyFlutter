import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../data/app_data.dart';
import '../models/belt.dart';

class BeltTile extends StatelessWidget {
  final Belt belt;
  const BeltTile({super.key, required this.belt});

  Color get color => switch (belt) {
    Belt.white => Colors.white,
    Belt.blue => Colors.blue,
    Belt.purple => Colors.deepPurple,
    Belt.brown => Colors.brown,
    Belt.black => Colors.black,
  };

  @override
  Widget build(BuildContext context) {
    final count = positions.where((p) => p.belt == belt).length;
    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        leading: Container(width: 52, height: 36, decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.grey.shade500)), child: belt == Belt.black ? const Icon(Icons.sports_martial_arts, color: Colors.white) : const Icon(Icons.sports_martial_arts)),
        title: Text('Faixa ${belt.label}', style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w800)),
        subtitle: Text('$count posições permitidas'),
        trailing: const Icon(Icons.chevron_right),
        onTap: () => context.push('/belt/${belt.name}'),
      ),
    );
  }
}
