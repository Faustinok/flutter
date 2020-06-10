import 'package:contacts/model/contatoModel.dart';
import 'package:contacts/model/userModel.dart';
import 'package:contacts/screens/createcontato.dart';
import 'package:flutter/material.dart';

class ListaContatos extends StatefulWidget {
  UserModel userModel = UserModel.vazio();
  ListaContatos(this.userModel);
  @override
  _ListaContatosState createState() => _ListaContatosState(userModel);
}

class _ListaContatosState extends State<ListaContatos> {
  UserModel userModel = UserModel.vazio();
  _ListaContatosState(this.userModel);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text("${userModel.nome} ${userModel.sobrenome}"),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CreateContato(userModel)));
              },
            )
          ],
        ),
        body: ListView(
          children: <Widget>[
            Card(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 80.0,
                    height: 80.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage("assets/personpng.png"),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Gabriel Faustino",
                          style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "faustinoknada@gmail.com",
                          style: TextStyle(fontSize: 18.0),
                        ),
                        Text(
                          "62991766891",
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )),
          ],
        ));
  }
}
