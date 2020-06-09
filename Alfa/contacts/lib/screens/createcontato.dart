import 'package:contacts/Dao/Daofirebase.dart';
import 'package:contacts/components/textfields.dart';
import 'package:contacts/model/contatoModel.dart';
import 'package:flutter/material.dart';

class CreateContato extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController tsxtnome = TextEditingController();
    TextEditingController txtsobrenome = TextEditingController();
    TextEditingController txtemail = TextEditingController();
    TextEditingController txttelefone = TextEditingController();
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text("Novo contato"),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.location_on), onPressed: () {})
          ],
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Center(
                  child: Container(
                    width: 120.0,
                    height: 120.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey,
                      image: DecorationImage(
                        image: AssetImage("assets/personpng.png"),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  child: Text(
                    "Adicionar foto",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.red),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 8.0)),
                TexfieldComponent(
                  label: "Nome",
                  controller: tsxtnome,
                  obscure: false,
                  textInputType: TextInputType.text,
                ),
                TexfieldComponent(
                  label: "Sobrenome",
                  controller: tsxtnome,
                  obscure: false,
                  textInputType: TextInputType.text,
                ),
                TexfieldComponent(
                  label: "telefone",
                  controller: tsxtnome,
                  obscure: false,
                  textInputType: TextInputType.phone,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: RaisedButton(
                    color: Colors.red,
                    padding: EdgeInsets.only(
                        top: 15.0, bottom: 15.0, left: 90.0, right: 90.0),
                    child: Text("Salvar",
                        style: TextStyle(fontSize: 20.0, color: Colors.white)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    onPressed: () async {
                      ContatoModel contatoModel = ContatoModel.nomeSobrenome(
                          tsxtnome.text, txtsobrenome.text, txttelefone.text);
                      FirebaseDao firebaseDao = FirebaseDao.vazio();
                      print("criando usuario");
                      firebaseDao.criarContato(contatoModel);
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
