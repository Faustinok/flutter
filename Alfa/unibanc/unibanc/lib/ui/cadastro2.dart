import 'dart:math';
import 'package:flutter/material.dart';
import 'package:unibanc/user/user.dart';

import 'home.dart';

class Cadastro2 extends StatelessWidget {
  var rng = new Random();
  User user = new User.vazio();
  User userValidator;
  final String newUser;
  final String newEmail;
  double debito = 1000.0; 
  int conta;
  Cadastro2(this.newEmail,this.newUser);
  TextEditingController txtFildSobrenome = new TextEditingController(); 
  TextEditingController txtSenha = new TextEditingController();
  validarForm(){
   return user.selectUser(newEmail, txtSenha.text); 

  }  
  generateConta(){
    conta =rng.nextInt(999999); 
  }

  cadastrar(String user, String sobrenome,String email, String senha ,double deb , int cont ){
    User userInsert = User(user,sobrenome,cont,email,senha,deb); 
    userInsert.insertUser(userInsert);
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey ,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Cadastro"),
      ),
      body:   
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top:30.0),
              child: Image.network("https://www.unialfa.com.br/2018/img/header-logo-unialfa.png",),
            ),
            TextField(
                controller: txtFildSobrenome,
                decoration: InputDecoration(
                  labelText: "Sobrenome",
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(),
                  enabledBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  )
                ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:20.0),
              child: TextField( 
                  controller: txtSenha,               
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Senha",
                    labelStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(),
                    enabledBorder: const OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    )
                  ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: RaisedButton( 
                 color: Colors.teal,
                padding: EdgeInsets.all(15.0),
                  child: Text("Salvar",
                  style: TextStyle(fontSize: 20.0)
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)
                  ),
                  ),
                  onPressed: () {
                    generateConta();
                    cadastrar(newUser,txtFildSobrenome.text,newEmail,txtSenha.text,debito,conta);
                    userValidator = validarForm();
                    if (userValidator.id == null){
                      txtFildSobrenome.text ="";
                      txtSenha.text ="";
                    } else {
                      Navigator.push(
                        context, 
                        (MaterialPageRoute(
                          builder: (context) =>Home(userValidator)
                          )
                        )
                        );                      
                    }                    

                  },
                  ),
            ),

          ],
        ),
        ),
      ),
    );
  }

}