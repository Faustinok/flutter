import 'package:contacts/Dao/Daofirebase.dart';
import 'package:contacts/components/textfields.dart';
import 'package:contacts/model/userModel.dart';
import 'package:contacts/screens/cadastro.dart';
import 'package:contacts/screens/lista_contatos.dart';
import 'package:flutter/material.dart';
import '';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  FirebaseDao firebaseDao = FirebaseDao.vazio();
  TextEditingController txtLogin = TextEditingController();
  TextEditingController txtsenha = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.2),
            child: Center(
                child: Column(
              children: <Widget>[
                Text("Contacts",
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 32.0)),
                TexfieldComponent(
                  label: "Usuario",
                  controller: txtLogin,
                  obscure: false,
                  textInputType: TextInputType.emailAddress,
                ),
                TexfieldComponent(
                  label: "Senha",
                  controller: txtsenha,
                  obscure: true,
                  textInputType: TextInputType.text,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: RaisedButton(
                    color: Colors.red,
                    padding: EdgeInsets.only(
                        top: 15.0, bottom: 15.0, left: 90.0, right: 90.0),
                    child: Text("Entrar",
                        style: TextStyle(fontSize: 20.0, color: Colors.white)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    onPressed: () async {
                      UserModel userModel = UserModel.vazio();
                      userModel = await firebaseDao.login(
                          email: txtLogin.text, senha: txtsenha.text);
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => ListaContatos(userModel)),
                          (Route<dynamic> route) => false);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: OutlineButton(
                    splashColor: Colors.grey,
                    onPressed: () async {
                      UserModel userModel = UserModel.vazio();
                      userModel = await firebaseDao.loginGoogle();
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => ListaContatos(userModel)),
                          (Route<dynamic> route) => false);
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                    highlightElevation: 0,
                    borderSide: BorderSide(color: Colors.grey),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image(
                              image: AssetImage("assets/google_logo.png"),
                              height: 35.0),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              'Sign in with Google',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.grey,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.70, left: 20.0),
            child: GestureDetector(
              child: Text(
                "Cadastre-se",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Cadastro()));
              },
            ),
          )
        ],
      ),
    );
  }
}
