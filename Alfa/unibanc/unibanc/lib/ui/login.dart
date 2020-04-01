import 'package:flutter/material.dart';
import 'package:unibanc/user/user.dart';

import 'cadastro1.dart';
import 'home.dart';

class Login extends StatelessWidget {
  User user = new User.vazio();
  User userValidator;
  TextEditingController txtUserValidate = new TextEditingController();
  TextEditingController txtPwdValidate = new TextEditingController();
  validarForm(BuildContext context) async {
    userValidator = await user.selectUserByLogin(txtUserValidate.text, txtPwdValidate.text);
    if (userValidator == null) {
      txtUserValidate.text = "";
      txtPwdValidate.text = "";
    } else {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Home(userValidator)),
          (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 80.0),
                child: Image.network(
                  "https://www.unialfa.com.br/2018/img/header-logo-unialfa.png",
                ),
              ),
              TextField(
                controller: txtUserValidate,
                decoration: InputDecoration(
                    labelText: "Usuario",
                    labelStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: TextField(
                  controller: txtPwdValidate,
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: "Senha",
                      labelStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: RaisedButton(
                  color: Color.fromRGBO(159, 33, 29, 1.0),
                  padding: EdgeInsets.all(15.0),
                  child: Text("Entrar", style: TextStyle(fontSize: 20.0)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  onPressed: () {
                    validarForm(context);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: GestureDetector(
                  child: Text(
                    "Cadastre-se",
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        decoration: TextDecoration.underline),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        (MaterialPageRoute(builder: (context) => Cadastro1())));
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
