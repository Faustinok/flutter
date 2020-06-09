import 'package:contacts/Dao/Daofirebase.dart';
import 'package:contacts/components/textfields.dart';
import 'package:contacts/model/userModel.dart';
import 'package:contacts/screens/lista_contatos.dart';
import 'package:flutter/material.dart';

class Cadastro extends StatelessWidget {
  FirebaseDao _firebaseDao = FirebaseDao.vazio();
  TextEditingController txtnome = new TextEditingController();
  TextEditingController txtsobrenome = new TextEditingController();
  TextEditingController txtemail = new TextEditingController();
  TextEditingController txtsenha = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.red,
          centerTitle: true,
          title: Text("Cadastro"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TexfieldComponent(
                controller: txtnome,
                label: "Nome",
                obscure: false,
                textInputType: TextInputType.text,
              ),
              TexfieldComponent(
                controller: txtsobrenome,
                label: "Sobrenome",
                obscure: false,
                textInputType: TextInputType.text,
              ),
              TexfieldComponent(
                controller: txtemail,
                label: "Email",
                obscure: false,
                textInputType: TextInputType.emailAddress,
              ),
              TexfieldComponent(
                controller: txtsenha,
                label: "Senha",
                obscure: true,
                textInputType: TextInputType.text,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: RaisedButton(
                  color: Colors.red,
                  padding: EdgeInsets.only(
                      top: 15.0, bottom: 15.0, left: 90.0, right: 90.0),
                  child: Text("Cadastrar",
                      style: TextStyle(fontSize: 20.0, color: Colors.white)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  onPressed: () async {
                    UserModel _userModel = UserModel(
                        txtnome.text, txtsobrenome.text, txtemail.text);
                    _userModel.userid = await _firebaseDao.cadastroUser(
                        userModel: _userModel, senha: txtsenha.text);

                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => ListaContatos(_userModel)),
                        (Route<dynamic> route) => false);
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
