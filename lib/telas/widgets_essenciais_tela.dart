import 'package:flutter/material.dart';

import '../widgets/celula.dart';

const _ciano = Color(0xFF1ED6E6);

Widget _caixa(double lado) {
  return Container(width: lado, height: lado, color: _ciano);
}

// Basic Widgets: Container, Row, Column, Image, Text e Icon.
class WidgetsEssenciaisTela extends StatelessWidget {
  const WidgetsEssenciaisTela({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Widgets essenciais')),
      body: GridView.count(
        crossAxisCount: 3,
        padding: const EdgeInsets.all(12),
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 0.8,
        children: [
          Celula(
            titulo: 'Container',
            filho: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: _ciano,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFF3F68B5), width: 5),
              ),
            ),
          ),
          Celula(
            titulo: 'Row',
            filho: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [_caixa(18), const SizedBox(width: 8), _caixa(30)],
              ),
            ),
          ),
          Celula(
            titulo: 'Column',
            filho: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [_caixa(20), const SizedBox(height: 8), _caixa(30)],
              ),
            ),
          ),
          Celula(
            titulo: 'Image',
            filho: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(3),
              child: Image.asset('assets/images/coruja.png', width: 70, height: 70, fit: BoxFit.cover),
            ),
          ),
          Celula(
            titulo: 'Text',
            filho: Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              child: const Text(
                'Abc',
                style: TextStyle(fontSize: 30, color: Color(0xFF3F68B5)),
              ),
            ),
          ),
          const Celula(
            titulo: 'Icon',
            fundo: Colors.white,
            filho: FlutterLogo(size: 48),
          ),
        ],
      ),
    );
  }
}
