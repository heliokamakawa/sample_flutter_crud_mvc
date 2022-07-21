import 'package:flutter_crud_mvc/modelo/base/modelo.dart';

class Tarefa extends Modelo{
  final String nome;
  final String descricao;
  final DateTime dataEntrega;

  Tarefa({required id,required this.nome,required this.descricao,required this.dataEntrega}) : super(id);
}