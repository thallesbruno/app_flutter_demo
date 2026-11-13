import 'package:flutter/material.dart';

import 'telas/aparencia_tela.dart';
import 'telas/cupertino_tela.dart';
import 'telas/hello_flutter_tela.dart';
import 'telas/hierarquia_tela.dart';
import 'telas/inspector_tela.dart';
import 'telas/projeto_tela.dart';
import 'telas/sqlite_tela.dart';
import 'telas/stateless_stateful_tela.dart';
import 'telas/widgets_essenciais_tela.dart';
import 'telas/widgets_estrutura_tela.dart';

// Cada item do menu aponta para uma tela que reproduz um slide da Aula 2.
class Demo {
  final String titulo;
  final String slide;
  final Widget Function() tela;

  Demo(this.titulo, this.slide, this.tela);
}

class MenuTela extends StatelessWidget {
  const MenuTela({super.key});

  @override
  Widget build(BuildContext context) {
    final demos = <Demo>[
      Demo('Stateless e Stateful', 'Slide: Stateless e Stateful', () => const StatelessStatefulTela()),
      Demo('Aparência: Material x Cupertino', 'Slide: Os 3 princípios dos widgets', () => const AparenciaTela()),
      Demo('Widgets Cupertino', 'Slide: Catálogo de widgets', () => const CupertinoTela()),
      Demo('Widgets essenciais', 'Slide: Container, Row, Column, Image, Text, Icon', () => const WidgetsEssenciaisTela()),
      Demo('Widgets essenciais: estrutura', 'Slide: Button, Scaffold, AppBar', () => const WidgetsEstruturaTela()),
      Demo('Hierarquia de widgets', 'Slides: Hierarquia de widgets e em código', () => const HierarquiaTela()),
      Demo('Hello Flutter', 'Slide: Directionality + Text', () => const HelloFlutterTela()),
      Demo('Hello Flutter: centralizando', 'Slide: Directionality + Center + Text', () => const HelloCentralizandoTela()),
      Demo('Estrutura de um projeto', 'Slide: Estrutura de um projeto Flutter', () => const ProjetoTela()),
      Demo('Widget Inspector', 'Slide: Widget Inspector', () => const InspectorTela()),
      Demo('SQLite (sqflite)', 'Slides: SQLite e persistência de dados', () => const SqliteTela()),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Flutter - Aula 2')),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: demos.length,
        itemBuilder: (context, indice) {
          final demo = demos[indice];
          return Card(
            child: ListTile(
              leading: CircleAvatar(child: Text('${indice + 1}')),
              title: Text(demo.titulo),
              subtitle: Text(demo.slide),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => demo.tela()),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
