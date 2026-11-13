import 'package:flutter/material.dart';

// Stateless x Stateful: o Container não muda; o Switch guarda estado.
class StatelessStatefulTela extends StatelessWidget {
  const StatelessStatefulTela({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stateless e Stateful')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: _Cartao(
                titulo: 'Stateless',
                descricao: 'Depois de criado, não muda. Exemplo: Container.',
                filho: Container(width: 120, height: 80, color: Colors.indigo),
              ),
            ),
            const SizedBox(height: 16),
            const Expanded(
              child: _Cartao(
                titulo: 'Stateful',
                descricao: 'Incorpora interação. Exemplo: Switch.',
                filho: ChaveComEstado(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Cartao extends StatelessWidget {
  final String titulo;
  final String descricao;
  final Widget filho;

  const _Cartao({required this.titulo, required this.descricao, required this.filho});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(titulo, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 4),
            Text(descricao),
            const SizedBox(height: 16),
            filho,
          ],
        ),
      ),
    );
  }
}

// StatefulWidget: setState redesenha a tela quando o valor muda.
class ChaveComEstado extends StatefulWidget {
  const ChaveComEstado({super.key});

  @override
  State<ChaveComEstado> createState() => _ChaveComEstadoState();
}

class _ChaveComEstadoState extends State<ChaveComEstado> {
  bool _ligado = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Switch(
          value: _ligado,
          onChanged: (valor) => setState(() => _ligado = valor),
        ),
        Text(_ligado ? 'Ligado' : 'Desligado'),
      ],
    );
  }
}
