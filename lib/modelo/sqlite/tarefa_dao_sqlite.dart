
import 'package:flutter_crud_mvc/modelo/tarefa.dart';
import 'package:flutter_crud_mvc/modelo/sqlite/conexao.dart';
import 'package:flutter_crud_mvc/modelo/tarefa_dao.dart';
import 'package:sqflite/sqflite.dart';

class TarefaDAOSQLite implements TarefaDAO{
  @override
  Future<bool> salvar(Tarefa tarefa) async {
    const sql = 'INSERT INTO tarefa (nome, descricao, data_entrega) VALUES (?,?,?)';
    Database db = await Conexao.abrir(); 
    var linhasAfetadas = await db.rawInsert(sql,[tarefa.nome,tarefa.descricao,tarefa.dataEntrega.toString()]);
    return linhasAfetadas > 0;
  }
  @override
  Future<bool> alterar(Tarefa tarefa) async {
    const sql = 'UPDATE tarefa SET nome=?, descricao=?, data_entrega=?) WHERE id = ?';
    Database db = await Conexao.abrir();
    var linhasAfetadas = await db.rawUpdate(sql,[tarefa.nome, tarefa.dataEntrega, tarefa.dataEntrega, tarefa.id]);
    return linhasAfetadas > 0;
  }
  
  @override
  Future<Tarefa> consultar(int id) async {
    const sql = 'SELECT * FROM tarefa WHERE id = ?';
    Database db = await Conexao.abrir();
    Map<String,Object?> resultado = (await db.rawQuery(sql,[id])).first;
    if(resultado.isEmpty) throw Exception('Sem registros com este id');
    Tarefa tarefa = Tarefa(id: resultado['id'], nome: resultado['nome'].toString(), descricao: resultado['descricao'].toString(), dataEntrega: DateTime.parse(resultado['data_entrega'].toString()) );
    return tarefa;
  }

  @override
  Future<bool> excluir(int id) async{
    const sql = 'DELETE FROM tarefa WHERE id = ?';
    Database db = await Conexao.abrir();
    int linhasAfetadas = await db.rawDelete(sql,[id]);
    return linhasAfetadas > 0;
  }
  
  @override
  Future<List<Tarefa>> listar() async {
    const sql = 'SELECT * FROM tarefa';
    Database db = await Conexao.abrir();
    List<Map<String,Object?>> resultado = (await db.rawQuery(sql));
    if(resultado.isEmpty) throw Exception('Sem registros');
    List<Tarefa> tarefas = resultado.map((linha) { 
      return Tarefa(
        id: linha['id'], 
        nome: linha['nome'].toString(), 
        descricao: linha['descricao'].toString(), 
        dataEntrega: DateTime.parse(linha['data_entrega'].toString()) );
    }).toList() ;
    return tarefas;
  }
}