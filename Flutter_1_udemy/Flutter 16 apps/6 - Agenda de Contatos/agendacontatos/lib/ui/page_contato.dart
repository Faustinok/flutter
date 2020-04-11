import 'dart:io';
import 'package:agendacontatos/model/contato.dart';
import 'package:agendacontatos/model/contato_dao.dart';
import 'package:agendacontatos/ui/homecontatos.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


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
  Contato editedContato;
 ContatoDao _dao = ContatoDao();



  salvarAlterarContato(BuildContext context) async {
     if (widget.contato == null) {
    editedContato = Contato(txtnome.text,txtemail.text, txttelefone.text,null);
     _dao.saveContato(editedContato);
     } else { 
         _dao.updateContato(editedContato);    
     }
    
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => HomeContatos()),
        (Route<dynamic> route) => false);
  }

    Future<bool> _requestpop(){
      if(_useredited){
        showDialog(
          context: context,
          builder: (context){
            return AlertDialog(
              title: Text("Descartar alterações? "),
              content: Text("caso saia, alterações serão perdidas"),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child:Text("Cancelar")
                  ),
                FlatButton(
                  onPressed:() {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                   child: Text("Sim")
                   )
              ],
            );
          
          }
          
          );
      return Future.value(false);
      } else {
        return Future.value(true);
      }
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

    }
  }

  @override
  Widget build(BuildContext context) {

    return 
    WillPopScope(
       onWillPop: _requestpop,
    child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(editedContato.nome == null ? "Novo contato" : editedContato.nome),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red,
          child: Icon(Icons.save),
          onPressed: () {
            if (txtnome.text.isNotEmpty && txttelefone.text.isNotEmpty){ 
              editedContato.nome =txtnome.text;
              editedContato.email =txtemail.text;
              editedContato.telefone =txttelefone.text;
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
                onTap: (){
                  ImagePicker.pickImage(source: ImageSource.camera).then((file){
                    if(file == null) return;
                    setState(() {
                      editedContato.img = file.path;
                    });
                  });
                },
              ),
              TextField(
                controller: txtnome,
                decoration: InputDecoration(labelText: "nome"),
                onChanged: (text) {
                  _useredited = true;
                    setState(() {
                      editedContato.nome=text;
                    });

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
                    editedContato.email=text;              
                },
                keyboardType: TextInputType.emailAddress,
              ),   
              TextField(
                controller: txttelefone,
                decoration: InputDecoration(labelText: "telefone"),
                onChanged: (text) {
                  _useredited = true; 
                    editedContato.telefone=text;
                },
                keyboardType: TextInputType.phone
              ),              
            ],    
          ),
          ),
    ),
    );
  }  
}
