import 'package:flutter/material.dart';

// Cartão usado na tela de widgets essenciais: quadro colorido + legenda.
class Celula extends StatelessWidget {
  final String titulo;
  final Widget filho;
  final Color fundo;

  const Celula({
    super.key,
    required this.titulo,
    required this.filho,
    this.fundo = const Color(0xFF4A14B0),
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            width: double.infinity,
            color: fundo,
            child: Center(child: filho),
          ),
        ),
        const SizedBox(height: 6),
        Text(titulo, style: const TextStyle(color: Color(0xFF1A73E8))),
      ],
    );
  }
}
