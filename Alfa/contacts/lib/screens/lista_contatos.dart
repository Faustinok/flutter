import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contacts/Dao/Daofirebase.dart';
import 'package:contacts/model/contatoModel.dart';
import 'package:contacts/model/userModel.dart';
import 'package:contacts/screens/createcontato.dart';
import 'package:contacts/screens/login.dart';
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
  String image = "assets/personpng.png";
  ImageSelector(ContatoModel contatoModel) {
    if (contatoModel.url == "") {
      return Container(
        width: 80.0,
        height: 80.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey,
          image: DecorationImage(image: AssetImage(image)),
        ),
      );
    } else {}
    return Container(
      width: 120.0,
      height: 120.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey,
      ),
      child: Image.network(contatoModel.url),
    );
  }

  _listaContato(BuildContext context, DocumentSnapshot snapshot) {
    //print(snapshot.data);

    ContatoModel contato = ContatoModel.fromMap(snapshot.data);
    return GestureDetector(
      onTap: () {
        contato.contatoid = snapshot.documentID;
        print(snapshot.documentID);
        print(contato.contatoid);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Createcontato(
                      contatoModel: contato,
                      userModel: userModel,
                    )));
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              ImageSelector(contato),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "${contato.nome} ${contato.sobrenome}",
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      contato.email,
                      style: TextStyle(fontSize: 18.0),
                    ),
                    Text(
                      contato.telefone,
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

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
                icon: Icon(Icons.power_settings_new),
                onPressed: () async {
                  FirebaseDao firebaseDao = FirebaseDao.vazio();
                  await firebaseDao.logout();
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => Login()),
                      (Route<dynamic> route) => false);
                }),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Createcontato(
                              userModel: userModel,
                            )));
              },
            )
          ],
        ),
        body: StreamBuilder(
          stream: Firestore.instance
              .collection('users')
              .document(userModel.userid)
              .collection('contatos')
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
              itemCount: snapshot.data.documents.toList().length,
              itemBuilder: (context, index) {
                return _listaContato(context, snapshot.data.documents[index]);
              },
            );
          },
        ));
  }
}
