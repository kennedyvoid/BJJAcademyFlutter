import 'package:flutter/material.dart';
import '../data/app_data.dart';
import '../models/belt.dart';
import '../widgets/app_scaffold.dart';

class RulesScreen extends StatelessWidget {
  const RulesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      index: 3,
      title: 'Regras',
      child: DefaultTabController(
        length: 3,
        child: Column(children: [
          const TabBar(tabs: [Tab(text:'Pontuação'), Tab(text:'Proibidas'), Tab(text:'Observações')]),
          Expanded(child: TabBarView(children: [
            _List(items: scoreRules),
            ListView(padding: const EdgeInsets.all(16), children: [
              for (final belt in Belt.values) Card(child: ExpansionTile(title: Text('Faixa ${belt.label}', style: const TextStyle(fontWeight: FontWeight.w800)), children: [
                ...prohibited.where((p)=>p.belt==belt).map((p)=>ListTile(leading: const Icon(Icons.block), title: Text(p.name), subtitle: Text(p.reason))),
                if (prohibited.where((p)=>p.belt==belt).isEmpty) const ListTile(title: Text('Sem restrições adicionais cadastradas.'))
              ])),
            ]),
            const _List(items: ['As regras podem variar conforme federação, idade, modalidade e evento.','Antes de competir, valide sempre o edital oficial do campeonato.','Este app é guia de estudo e não substitui arbitragem oficial.']),
          ])),
        ]),
      ),
    );
  }
}

class _List extends StatelessWidget { final List<String> items; const _List({required this.items}); @override Widget build(BuildContext context)=>ListView(padding: const EdgeInsets.all(16), children: [for(final item in items) Card(child: ListTile(leading: const Icon(Icons.check_circle_outline), title: Text(item)))]); }
