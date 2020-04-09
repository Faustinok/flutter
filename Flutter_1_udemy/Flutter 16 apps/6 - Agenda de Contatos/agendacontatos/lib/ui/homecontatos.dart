import 'dart:io';

import 'package:agendacontatos/model/contato.dart';
import 'package:agendacontatos/model/contato_dao.dart'; 
import 'package:agendacontatos/ui/page_contato.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HomeContatos extends StatefulWidget {
  @override
  
  _HomeContatosState createState() => _HomeContatosState();
}

class _HomeContatosState extends State<HomeContatos> {
   ContatoDao _dao = ContatoDao();
  List<Contato> contatos = List();
 
  @override
  void initState() {
    super.initState();
    getcontatos();

  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Contatos"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: Icon(Icons.add),
        onPressed: (){
          showContatoCadastro();
          
        }
        ),
      body: ListView.builder(
        itemCount: contatos != null ? contatos.length : 0 ,
        padding: EdgeInsets.all(10.0),
        itemBuilder: (context, index){
          return _contatosCard(context, contatos[index]);
        }),
    );
  }
  Widget _contatosCard (BuildContext context, Contato contato) {
    return GestureDetector(
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            children: <Widget>[
              Container(
                width: 80.0,
                height: 80.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image:DecorationImage( 
                    image: contato.img != null ? 
                            FileImage(File(contato.img)) : AssetImage("images/person_image.jpg"),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(contato.nome ?? "",
                    style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
                    ),
                    Text(contato.email ?? "",
                    style: TextStyle(fontSize: 18.0) 
                    ),
                    Text(contato.telefone ?? "",
                    style: TextStyle(fontSize: 18.0) 
                    )                    
                  ],
                ),)
            ],
          ),
          ),
      ),
      onTap: (){
        showContatoCadastro(contato: contato);
      },
    );
  }
  showContatoCadastro({Contato contato} )async {
    await Navigator.push(context, 
    MaterialPageRoute(builder: (context)=> ContatoCadastro(contato: contato,)
    )
    
    );
    getcontatos();
  }
  getcontatos(){
       _dao.selectContatos().then((listadecontatos){
      setState(() {
        contatos=listadecontatos;
      }); 

    });
  }
}