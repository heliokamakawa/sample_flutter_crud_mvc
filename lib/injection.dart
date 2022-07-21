import 'package:flutter_crud_mvc/modelo/sqlite/tarefa_dao_sqlite.dart';
import 'package:flutter_crud_mvc/modelo/tarefa_dao.dart';
import 'package:get_it/get_it.dart';

setupInjection() async{
  GetIt getIt = GetIt.I;
  
  getIt.registerSingleton<TarefaDAO>(TarefaDAOSQLite());
}