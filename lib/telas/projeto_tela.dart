import 'package:flutter/material.dart';

// Imagem e descrição do slide "Estrutura de um projeto Flutter".
class ProjetoTela extends StatelessWidget {
  const ProjetoTela({super.key});

  static const _itens = [
    ['lib/main.dart', 'onde fica o seu código Dart'],
    ['.idea', 'usado pelo VS Code ou outras IDEs (não alterar)'],
    ['android, ios', 'código nativo gerado a partir do Dart (não alterar)'],
    ['build', 'arquivos gerados no build multiplataforma (não alterar)'],
    ['test', 'pode ser usado para criar testes automatizados'],
    ['.gitignore', 'para controle de versão no Git'],
    ['.metadata etc.', 'arquivos de configuração'],
    ['pubspec.yaml', 'descrição das dependências de módulos de código nativos'],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Estrutura de um projeto')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Center(
            child: Image.asset('assets/images/projeto.png', height: 300),
          ),
          const Center(child: Text('No VS Code com plugin Flutter')),
          const SizedBox(height: 16),
          for (final item in _itens)
            ListTile(
              dense: true,
              title: Text(
                item[0],
                style: const TextStyle(fontFamily: 'monospace', fontWeight: FontWeight.bold),
              ),
              subtitle: Text(item[1]),
            ),
        ],
      ),
    );
  }
}
