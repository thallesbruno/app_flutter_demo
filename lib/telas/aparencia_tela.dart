import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Mesmo widget, duas aparências: Cupertino (iOS) e Material (Android).
class AparenciaTela extends StatefulWidget {
  const AparenciaTela({super.key});

  @override
  State<AparenciaTela> createState() => _AparenciaTelaState();
}

class _AparenciaTelaState extends State<AparenciaTela> {
  bool _ios = true;
  bool _android = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Material x Cupertino')),
      body: Center(
        child: Container(
          width: 320,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: const Color(0xFF4A14B0),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'SWITCH',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      CupertinoSwitch(
                        value: _ios,
                        onChanged: (valor) => setState(() => _ios = valor),
                      ),
                      const SizedBox(height: 8),
                      const Text('Cupertino / iOS', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  Column(
                    children: [
                      Switch(
                        value: _android,
                        onChanged: (valor) => setState(() => _android = valor),
                      ),
                      const SizedBox(height: 8),
                      const Text('Material / Android', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
