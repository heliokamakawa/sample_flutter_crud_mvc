import 'package:flutter/material.dart';
import 'package:flutter_crud_mvc/injection.dart';
import 'package:flutter_crud_mvc/visao/tarefa_form.dart';
import 'package:flutter_crud_mvc/visao/tarefa_lista.dart';

void main() async  {
  setupInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/' :(context) => TarefaLista(),
        '/tarefaForm' :(context) => TarefaForm()
      },
    );
  }
}


