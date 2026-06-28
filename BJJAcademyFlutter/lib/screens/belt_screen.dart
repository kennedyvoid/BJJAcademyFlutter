import 'package:flutter/material.dart';
import '../data/app_data.dart';
import '../models/belt.dart';
import '../widgets/position_card.dart';

class BeltScreen extends StatelessWidget {
  final Belt belt;
  const BeltScreen({super.key, required this.belt});
  @override
  Widget build(BuildContext context) {
    final items = positions.where((p) => p.belt == belt).toList();
    return Scaffold(
      appBar: AppBar(title: Text('Faixa ${belt.label}'), centerTitle: true),
      body: SafeArea(child: LayoutBuilder(builder: (context, c) {
        final columns = c.maxWidth < 360 ? 1 : c.maxWidth < 700 ? 2 : 3;
        return GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: columns, crossAxisSpacing: 14, mainAxisSpacing: 14, childAspectRatio: c.maxWidth < 360 ? 1.08 : .78),
          itemCount: items.length,
          itemBuilder: (_, i) => PositionCard(position: items[i]),
        );
      })),
    );
  }
}
