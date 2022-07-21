import 'package:flutter/material.dart';
import 'package:flutter_crud_mvc/controle/tarefa_conotrole.dart';
import 'package:flutter_crud_mvc/modelo/tarefa.dart';

// ignore: must_be_immutable
class TarefaForm extends StatelessWidget{
  final controle = TarefaControle();
  dynamic id;
  String? nome;
  String? descricao;
  String? dataEntrega;

  TarefaForm({Key? key}) : super(key: key);
  
  Widget _criarCampo(String rotulo, String? dica, ValueChanged<String>? vincularValor){
    return TextFormField(  
      decoration: InputDecoration(  
        label: Text(rotulo),
        hintText: dica
      ),
      onChanged: vincularValor,
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(   
      appBar: AppBar(  
        title: const Text('Cadastro Tarefa'),
        actions: [ 
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: (){
              final tarefa = Tarefa(id: id, nome: nome!, descricao: descricao!, dataEntrega: DateTime.parse(dataEntrega!));
              controle.salvar(tarefa);
              Navigator.pop(context);
            }
          ), 
        ],
      ),
      body:Form(  
        child: Column(
          children: [
            _criarCampo('Nome', 'Digite seu nome', (valorDigitado) => nome = valorDigitado),
            _criarCampo('Descrição', 'Descreva a tarefa', (valorDigitado) => descricao = valorDigitado),
            _criarCampo('Data', 'Defina a data de entrega', (valorDigitado) => dataEntrega = valorDigitado),
          ]
        ),
      )
    );
  }
}