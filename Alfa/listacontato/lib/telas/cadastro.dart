import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:listacontato/modelos/pessoas.dart';

class formCadastro extends StatelessWidget {
  TextEditingController _nomeControler =TextEditingController();
  TextEditingController _profissaoControler=TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro de Pessoas"),
        backgroundColor: Colors.cyan,
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0,128.0,8.0,0.0),
            child: TextFormField(
              controller: _nomeControler,
             decoration:InputDecoration(
               hintText: "Nome",
               border: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(4.5)
               )
             ) ,
             
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0,64.0,8.0,0.0),
            child: TextFormField(
             controller: _profissaoControler,
             decoration:InputDecoration(
               hintText: "profissao",
               border: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(4.5)
               )
             ) ,
             
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(128.0,64.0,128.0,0.0),
            child: RaisedButton(
              onPressed: ()=> this._criaPessoa(context),
              color: Colors.cyan,
              child: Text("Adicionar"),
              
              ),
          ),
            
        ],
      )
    );
  }

void _criaPessoa (BuildContext context) {
  String nome = this._nomeControler.text;
  String profissao = this._profissaoControler.text;
  if (nome.isNotEmpty && profissao.isNotEmpty) {
    pessoa fpessoa = pessoa(nome,profissao);
    Navigator.pop(context,fpessoa);
  }
}
}