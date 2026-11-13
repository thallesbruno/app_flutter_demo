import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../db/database_helper.dart';
import '../db/tarefa.dart';

// SQLite só funciona em Android e iOS (não no navegador nem no desktop).
bool get _sqliteSuportado {
  return !kIsWeb &&
      (defaultTargetPlatform == TargetPlatform.android ||
          defaultTargetPlatform == TargetPlatform.iOS);
}

class SqliteTela extends StatefulWidget {
  const SqliteTela({super.key});

  @override
  State<SqliteTela> createState() => _SqliteTelaState();
}

class _SqliteTelaState extends State<SqliteTela> {
  final _banco = DatabaseHelper.instance;
  List<Tarefa> _tarefas = [];

  @override
  void initState() {
    super.initState();
    if (_sqliteSuportado) _carregar();
  }

  // Lê do SQLite e chama setState para redesenhar a tela.
  Future<void> _carregar() async {
    final lista = await _banco.listar();
    setState(() => _tarefas = lista);
  }

  Future<void> _adicionar() async {
    final controller = TextEditingController();

    final titulo = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Nova tarefa'),
        content: TextField(
          controller: controller,
          autofocus: true,
          decoration: const InputDecoration(labelText: 'Título'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, controller.text),
            child: const Text('Salvar'),
          ),
        ],
      ),
    );

    if (titulo != null && titulo.trim().isNotEmpty) {
      await _banco.inserir(Tarefa(titulo: titulo.trim()));
      _carregar();
    }
  }

  Future<void> _alternar(Tarefa tarefa, bool valor) async {
    tarefa.concluida = valor;
    await _banco.atualizar(tarefa);
    _carregar();
  }

  Future<void> _excluir(Tarefa tarefa) async {
    await _banco.excluir(tarefa.id!);
    _carregar();
  }

  @override
  Widget build(BuildContext context) {
    if (!_sqliteSuportado) {
      return Scaffold(
        appBar: AppBar(title: const Text('SQLite (sqflite)')),
        body: const Center(
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Text(
              'O sqflite funciona em Android e iOS.\n'
              'Execute o app em um emulador ou celular Android.',
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('SQLite (sqflite)')),
      body: _tarefas.isEmpty
          ? const Center(child: Text('Nenhuma tarefa. Toque em + para criar.'))
          : ListView.builder(
              itemCount: _tarefas.length,
              itemBuilder: (context, indice) {
                final tarefa = _tarefas[indice];
                return ListTile(
                  title: Text(
                    tarefa.titulo,
                    style: TextStyle(
                      decoration: tarefa.concluida ? TextDecoration.lineThrough : null,
                    ),
                  ),
                  leading: Switch(
                    value: tarefa.concluida,
                    onChanged: (valor) => _alternar(tarefa, valor),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => _excluir(tarefa),
                  ),
                );
              },
            ),
      floatingActionButton: _sqliteSuportado
          ? FloatingActionButton(
              onPressed: _adicionar,
              child: const Icon(Icons.add),
            )
          : null,
    );
  }
}
