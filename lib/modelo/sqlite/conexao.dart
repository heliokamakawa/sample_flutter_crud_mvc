import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Conexao{
  static Database? _conexao; 
  static const String _criarTarefa = 'CREATE TABLE tarefa(id INTEGER PRIMARY KEY, nome TEXT, descricao TEXT, data_entrega TEXT)';
  static const String _insercao1 = 'INSERT INTO tarefa(nome, descricao, data_entrega) VALUES("Projeto","Projeto Web","2022-09-30")';
  static const String _insercao2 = 'INSERT INTO tarefa(nome, descricao, data_entrega) VALUES("Apresentação","Apresentação em grupo","2022-10-23")';
  static const String _insercao3 = 'INSERT INTO tarefa(nome, descricao, data_entrega) VALUES("Lista","Lista Exercícios","2022-11-30")';

  static Future<Database> abrir() async {
    if(_conexao == null){
      String path = join(await getDatabasesPath(), 'banco.db');
      //deleteDatabase(path);
      _conexao = await openDatabase(
        path,
        version: 1, 
        onCreate: (db, v){
          db.execute(_criarTarefa);
          db.execute(_insercao1);
          db.execute(_insercao2);
          db.execute(_insercao3);
        }, 
      );
    }
    return _conexao!;
  }
}