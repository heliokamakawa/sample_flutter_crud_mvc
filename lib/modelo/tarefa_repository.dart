
import 'package:flutter_crud_mvc/modelo/tarefa.dart';
import 'package:flutter_crud_mvc/modelo/tarefa_dao.dart';
import 'package:get_it/get_it.dart';

class TarefaRepository {
  TarefaDAO dao = GetIt.I.get<TarefaDAO>();
  
  Future<bool> salvar(Tarefa tarefa) async {
    return (tarefa.id == null) ?
      dao.salvar(tarefa): dao.alterar(tarefa);
  }
  
  Future<Tarefa> consultar(int id) async {
    return dao.consultar(id);
  }

  Future<bool> excluir(int id) async{
    return dao.excluir(id);
  }
  
  Future<List<Tarefa>> listar() async {
    return dao.listar();
  }
}