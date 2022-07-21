
import 'package:flutter_crud_mvc/modelo/tarefa_repository.dart';
import 'package:flutter_crud_mvc/modelo/tarefa.dart';

class TarefaServico {
  final _repository = TarefaRepository();

  bool _dataEntregaEValido(Tarefa tarefa){
    return tarefa.dataEntrega.compareTo(DateTime.now()) < 0;
  }

  bool _nomeEValido(Tarefa tarefa){
    return tarefa.nome.isNotEmpty;
  }

  bool tarefaEValido(Tarefa tarefa){
    return _dataEntregaEValido(tarefa) && _nomeEValido(tarefa);
  }

  Future<bool> salvar(Tarefa tarefa) async {
    if(!tarefaEValido(tarefa)) throw Exception('Tarefa inválido');
    return _repository.salvar(tarefa);
  }
  
  Future<Tarefa> consultar(int id) async {
    return _repository.consultar(id);
  }

  Future<bool> excluir(int id) async{
    return _repository.excluir(id);
  }
  
  Future<List<Tarefa>> listar() async {
    return _repository.listar();
  }
}