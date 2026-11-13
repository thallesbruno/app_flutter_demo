class Tarefa {
  int? id;
  String titulo;
  bool concluida;

  Tarefa({this.id, required this.titulo, this.concluida = false});

  // Objeto -> Map (para gravar no SQLite).
  Map<String, dynamic> toMap() {
    return {
      if (id != null) 'id': id,
      'titulo': titulo,
      'concluida': concluida ? 1 : 0,
    };
  }

  // Linha do banco (Map) -> objeto.
  factory Tarefa.fromMap(Map<String, dynamic> mapa) {
    return Tarefa(
      id: mapa['id'] as int,
      titulo: mapa['titulo'] as String,
      concluida: mapa['concluida'] == 1,
    );
  }
}
