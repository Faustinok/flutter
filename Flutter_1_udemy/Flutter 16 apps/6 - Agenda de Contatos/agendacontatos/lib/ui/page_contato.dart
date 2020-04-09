import 'dart:io';

import 'package:agendacontatos/model/contato.dart';
import 'package:flutter/material.dart';

class ContatoCadastro extends StatefulWidget {
  final Contato contato;
  ContatoCadastro({this.contato});
  @override
  _ContatoCadastroState createState() => _ContatoCadastroState();
}

class _ContatoCadastroState extends State<ContatoCadastro> {
  bool _useredited = false;
  Contato editedContato;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.contato == null) {
      editedContato = Contato.vazio();
    } else {
      editedContato = Contato.fromMap(widget.contato.toMap());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(editedContato.nome ?? "Novo Contato"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red,
          child: Icon(Icons.save),
          onPressed: () {}),
      body: SingleChildScrollView(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              GestureDetector(
                child: Container(
                  width: 140.0,
                  height: 140.0,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: editedContato.img != null
                              ? FileImage(File(editedContato.img))
                              : AssetImage("images/person_image.jpg"))),
                ),
              ),
              TextField(decoration: InputDecoration(labelText: "nome")),
              
              
            ],
          )),
    );
  }
}
