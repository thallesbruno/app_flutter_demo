import 'package:flutter/material.dart';

// Mais widgets essenciais: botão, Scaffold, AppBar, FlutterLogo e Placeholder.
class WidgetsEstruturaTela extends StatelessWidget {
  const WidgetsEstruturaTela({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Widgets: estrutura')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _Exemplo(
            titulo: 'RaisedButton',
            nota: 'Nas versões atuais do Flutter, o botão elevado é o ElevatedButton.',
            filho: ElevatedButton(onPressed: () {}, child: const Text('BUTTON')),
          ),
          _Exemplo(
            titulo: 'Scaffold',
            nota: 'Estrutura básica do Material Design: appBar, body, floatingActionButton, drawer...',
            filho: SizedBox(
              height: 240,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Scaffold(
                  appBar: AppBar(
                    automaticallyImplyLeading: false,
                    title: const Text('Scaffold'),
                  ),
                  body: const Center(child: Text('body')),
                  floatingActionButton: FloatingActionButton(
                    onPressed: () {},
                    child: const Icon(Icons.add),
                  ),
                ),
              ),
            ),
          ),
          _Exemplo(
            titulo: 'AppBar',
            filho: SizedBox(
              height: 56,
              child: AppBar(
                primary: false,
                automaticallyImplyLeading: false,
                backgroundColor: Colors.pink,
                foregroundColor: Colors.white,
                title: const Text('Appbar'),
              ),
            ),
          ),
          _Exemplo(
            titulo: 'FlutterLogo e Placeholder',
            filho: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                FlutterLogo(size: 72),
                SizedBox(width: 90, height: 90, child: Placeholder()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Exemplo extends StatelessWidget {
  final String titulo;
  final String? nota;
  final Widget filho;

  const _Exemplo({required this.titulo, required this.filho, this.nota});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(titulo, style: Theme.of(context).textTheme.titleMedium),
            if (nota != null) Text(nota!, style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(height: 12),
            Center(child: filho),
          ],
        ),
      ),
    );
  }
}
