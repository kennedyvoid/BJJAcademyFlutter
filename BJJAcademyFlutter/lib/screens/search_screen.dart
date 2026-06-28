import 'package:flutter/material.dart';
import '../data/app_data.dart';
import '../widgets/app_scaffold.dart';
import '../widgets/position_card.dart';

class SearchScreen extends StatefulWidget { const SearchScreen({super.key}); @override State<SearchScreen> createState()=>_SearchScreenState(); }
class _SearchScreenState extends State<SearchScreen> {
  String q='';
  @override Widget build(BuildContext context) {
    final items = positions.where((p)=>p.name.toLowerCase().contains(q.toLowerCase()) || p.belt.label.toLowerCase().contains(q.toLowerCase())).toList();
    return AppScaffold(index:1, title:'Buscar', child: LayoutBuilder(builder:(context,c){
      final columns = c.maxWidth < 360 ? 1 : c.maxWidth < 700 ? 2 : 3;
      return Column(children:[
        Padding(padding: const EdgeInsets.all(16), child: TextField(autofocus: true, onChanged:(v)=>setState(()=>q=v), decoration: InputDecoration(prefixIcon: const Icon(Icons.search), hintText:'Digite uma posição...', border: OutlineInputBorder(borderRadius: BorderRadius.circular(18))))),
        Expanded(child: GridView.builder(padding: const EdgeInsets.all(16), gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: columns, crossAxisSpacing: 14, mainAxisSpacing:14, childAspectRatio: c.maxWidth < 360 ? 1.08 : .78), itemCount:items.length, itemBuilder:(_,i)=>PositionCard(position:items[i])))
      ]);
    }));
  }
}
