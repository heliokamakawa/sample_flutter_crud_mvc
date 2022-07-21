
import 'package:flutter_crud_mvc/modelo/tarefa.dart';
import 'package:flutter_crud_mvc/modelo/tarefa_servico.dart';

class TarefaControle {
  var servico = TarefaServico();


  Future<bool> salvar(Tarefa tarefa) async {
    return servico.salvar(tarefa);
  }
  
  Future<Tarefa> consultar(int id) async {
    return servico.consultar(id);
  }

  Future<bool> excluir(int id) async{
    return servico.excluir(id);
  }
  
  Future<List<Tarefa>> listar() async {
    return servico.listar();
  }
}