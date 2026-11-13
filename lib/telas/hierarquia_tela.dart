import 'package:flutter/material.dart';

import 'hello_flutter_tela.dart';

// Imagem do slide "A very basic app / The widget hierarchy" + o app rodando.
class HierarquiaTela extends StatelessWidget {
  const HierarquiaTela({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hierarquia de widgets')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Image.asset('assets/images/hierarquia.png'),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'MaterialApp > Scaffold > AppBar + Center > Text',
            style: TextStyle(fontFamily: 'monospace'),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            icon: const Icon(Icons.play_arrow),
            label: const Text('Executar esse app'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HelloMaterialTela()),
              );
            },
          ),
        ],
      ),
    );
  }
}
