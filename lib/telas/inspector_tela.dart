import 'package:flutter/material.dart';

// Imagens do slide "Widget Inspector".
class InspectorTela extends StatelessWidget {
  const InspectorTela({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Widget Inspector')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Ferramenta poderosa para visualizar e inspecionar widget trees. '
            'Útil para entender layouts existentes e descobrir problemas nos layouts.',
          ),
          const SizedBox(height: 8),
          const Text('Disponível no plugin Flutter do Android Studio ou do IntelliJ IDEA.'),
          const SizedBox(height: 16),
          Image.asset('assets/images/inspector_barra.png'),
          const SizedBox(height: 16),
          Image.asset('assets/images/inspector_arvore.png'),
        ],
      ),
    );
  }
}
