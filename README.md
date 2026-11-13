# Projeto Integrador V-A: demonstração em Flutter

App para executar durante a aula. O menu inicial lista uma tela para cada slide da Aula 2 que traz uma tela ou imagem. Cada tela reproduz o exemplo do slide com widgets reais, e as imagens que não podem ser widgets (diagramas e capturas de tela) usam os mesmos arquivos do slide.

## Telas do app

| # | Tela | Slide | O que mostra |
|---|---|---|---|
| 1 | Stateless e Stateful | Stateless e Stateful | `Container` (sem estado) e `Switch` (com estado, `setState`) |
| 2 | Aparência: Material x Cupertino | Os 3 princípios dos widgets | `CupertinoSwitch` e `Switch` lado a lado |
| 3 | Widgets Cupertino | Catálogo de widgets | Action sheet, alert dialog, activity indicator e date picker |
| 4 | Widgets essenciais | Widgets essenciais | `Container`, `Row`, `Column`, `Image` (a coruja), `Text`, `Icon` |
| 5 | Widgets essenciais: estrutura | Widgets essenciais: estrutura | Botão, `Scaffold`, `AppBar`, `FlutterLogo`, `Placeholder` |
| 6 | Hierarquia de widgets | Hierarquia de widgets / em código | Imagem do slide + app `MaterialApp > Scaffold > AppBar + Center > Text` |
| 7 | Hello Flutter | Hello Flutter | `Directionality` + `Text` |
| 8 | Hello Flutter: centralizando | Hello Flutter: centralizando | `Directionality` + `Center` + `Text` |
| 9 | Estrutura de um projeto | Estrutura de um projeto Flutter | Imagem do VS Code e lista de pastas/arquivos |
| 10 | Widget Inspector | Widget Inspector | Imagens do Inspector |
| 11 | SQLite (sqflite) | SQLite e persistência | CRUD de tarefas com Database Helper |

Observação: o slide mostra `RaisedButton`, que foi removido do Flutter. A tela 5
usa o `ElevatedButton`, que é o equivalente atual.

## Estrutura do código

```
lib/
  main.dart                  MaterialApp
  menu_tela.dart             lista de telas
  telas/                     uma tela por slide
  widgets/celula.dart        quadro roxo usado nos widgets essenciais
  db/                        Tarefa + DatabaseHelper (SQLite)
assets/images/               imagens dos slides
```

## Como executar no Android Studio

1. Confira o ambiente: `flutter doctor` e `flutter doctor --android-licenses`.
2. Dentro desta pasta, gere as pastas de plataforma (só na 1ª vez):
   ```bash
   cd aula2_flutter_demo
   flutter create .
   flutter pub get
   ```
   (`flutter create .` não sobrescreve `lib/`, `assets/` nem `pubspec.yaml`.)
3. No Android Studio: **File > Open** e selecione a pasta `aula2_flutter_demo`.
4. Escolha um emulador Android (ou um celular com depuração USB) e clique em **Run**.

Para o emulador no Linux, instale o KVM (`sudo apt install qemu-kvm`), adicione o
usuário ao grupo `kvm` e reinicie a sessão.

A tela de SQLite só funciona em Android e iOS. Em navegador ou desktop ela exibe um aviso.
Para mostrar o Widget Inspector na aula, rode o app em modo debug e abra
**View > Tool Windows > Flutter Inspector**.
