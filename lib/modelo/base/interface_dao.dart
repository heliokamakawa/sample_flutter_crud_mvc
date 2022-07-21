import 'package:flutter_crud_mvc/modelo/base/modelo.dart';

abstract class InterfaceDAO<T extends Modelo> {
  Future<bool> salvar(T tarefa);
  Future<bool> alterar(T tarefa);
  Future<bool> excluir(int id);
  Future<T> consultar(int id);
  Future<List<T>> listar();
}