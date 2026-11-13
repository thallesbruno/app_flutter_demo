import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'tarefa.dart';

// Database Helper (Singleton): uma única conexão e métodos CRUD reutilizáveis.
class DatabaseHelper {
  DatabaseHelper._();
  static final DatabaseHelper instance = DatabaseHelper._();

  Database? _db;

  Future<Database> get database async {
    _db ??= await _abrir();
    return _db!;
  }

  // 1. Inicialização: caminho do arquivo .db + CREATE TABLE.
  // 2. Conexão: openDatabase abre o arquivo.
  Future<Database> _abrir() async {
    final caminho = join(await getDatabasesPath(), 'tarefas.db');
    return openDatabase(
      caminho,
      version: 1,
      onCreate: (db, versao) {
        return db.execute(
          'CREATE TABLE tarefas ('
          'id INTEGER PRIMARY KEY AUTOINCREMENT, '
          'titulo TEXT NOT NULL, '
          'concluida INTEGER NOT NULL DEFAULT 0)',
        );
      },
    );
  }

  // CREATE
  Future<void> inserir(Tarefa tarefa) async {
    final db = await database;
    await db.insert('tarefas', tarefa.toMap());
  }

  // READ
  Future<List<Tarefa>> listar() async {
    final db = await database;
    final linhas = await db.query('tarefas', orderBy: 'id DESC');
    return linhas.map(Tarefa.fromMap).toList();
  }

  // UPDATE
  Future<void> atualizar(Tarefa tarefa) async {
    final db = await database;
    await db.update(
      'tarefas',
      tarefa.toMap(),
      where: 'id = ?',
      whereArgs: [tarefa.id],
    );
  }

  // DELETE
  Future<void> excluir(int id) async {
    final db = await database;
    await db.delete('tarefas', where: 'id = ?', whereArgs: [id]);
  }
}
