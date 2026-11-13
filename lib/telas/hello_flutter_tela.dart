import 'package:flutter/material.dart';

// 1) Directionality + Text
class HelloFlutterTela extends StatelessWidget {
  const HelloFlutterTela({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hello Flutter')),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.white,
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: Text('Hello Flutter'),
              ),
            ),
          ),
          const _Arvore('Directionality\n  └─ Text'),
        ],
      ),
    );
  }
}

// 2) Directionality + Center + Text
class HelloCentralizandoTela extends StatelessWidget {
  const HelloCentralizandoTela({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hello Flutter: centralizando')),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.white,
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: Center(
                  child: Text('Hello Flutter'),
                ),
              ),
            ),
          ),
          const _Arvore('Directionality\n  └─ Center\n       └─ Text'),
        ],
      ),
    );
  }
}

// 3) MaterialApp > Scaffold > AppBar + Center > Text (código do slide de hierarquia)
class HelloMaterialTela extends StatelessWidget {
  const HelloMaterialTela({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hello Flutter App')),
      body: const Center(
        child: Text('Hello Flutter'),
      ),
    );
  }
}

// Mostra a árvore de widgets da tela.
class _Arvore extends StatelessWidget {
  final String texto;

  const _Arvore(this.texto);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFFE8EEF9),
      padding: const EdgeInsets.all(16),
      child: Text(texto, style: const TextStyle(fontFamily: 'monospace', fontSize: 16)),
    );
  }
}
