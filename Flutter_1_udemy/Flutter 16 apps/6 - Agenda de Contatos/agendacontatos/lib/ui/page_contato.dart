import 'dart:io';
import 'package:agendacontatos/model/contato.dart';
import 'package:agendacontatos/model/contato_dao.dart';
import 'package:agendacontatos/ui/homecontatos.dart';
import 'package:flutter/material.dart';


class ContatoCadastro extends StatefulWidget {
  final Contato contato;
  ContatoCadastro({this.contato});
  @override
  _ContatoCadastroState createState() => _ContatoCadastroState();
}

class _ContatoCadastroState extends State<ContatoCadastro> {
  TextEditingController txtnome = new TextEditingController();
  TextEditingController txtemail = new TextEditingController();
  TextEditingController txttelefone = new TextEditingController();
  bool _useredited = false;
  String nomeContato ="Novo Contato";
  Contato editedContato;
 ContatoDao _dao = ContatoDao();



  salvarAlterarContato(BuildContext context) async {
     if (widget.contato == null) {
    editedContato = Contato(txtnome.text,txtemail.text, txttelefone.text,"images/person_image.jpg");
     _dao.saveContato(editedContato);
     } else {
       editedContato = Contato(txtnome.text,txtemail.text, txttelefone.text,"fdkdg");
         _dao.updateContato(editedContato);    
     }
    
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => HomeContatos()),
        (Route<dynamic> route) => false);
  }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.contato == null) {
      editedContato = Contato.vazio();
    } else {
      editedContato = widget.contato;
      txtnome.text = editedContato.nome;
      txtemail.text = editedContato.email;
      txttelefone.text = editedContato.telefone;
      nomeContato= editedContato.nome;

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(nomeContato),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red,
          child: Icon(Icons.save),
          onPressed: () {
            if (txtnome.text.isNotEmpty && txttelefone.text.isNotEmpty){ 
              salvarAlterarContato(context);
            }
          }),
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
                              : AssetImage("images/person_image.jpg")
                              )
                              ),
                ),
              ),
              TextField(
                controller: txtnome,
                decoration: InputDecoration(labelText: "nome"),
                onChanged: (text) {
                  _useredited = true;
                  setState(() {
                    editedContato.nome = text;
                  });
                }
              ),
              TextField(
                controller: txtemail,
                decoration: InputDecoration(labelText: "email"),
                onChanged: (text) {
                  _useredited = true; 
                },
                keyboardType: TextInputType.emailAddress,
              ),   
              TextField(
                controller: txttelefone,
                decoration: InputDecoration(labelText: "telefone"),
                onChanged: (text) {
                  _useredited = true; 
                },
                keyboardType: TextInputType.phone
              ),              
            ],    
          ),
          ),
    );
  }
}
