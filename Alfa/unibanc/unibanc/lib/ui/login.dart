import 'package:flutter/material.dart';
import 'package:unibanc/user/user.dart';

import 'cadastro1.dart';
import 'home.dart';

class Login extends StatelessWidget {
  User user = new User.vazio();
  User userValidator;
  TextEditingController txtUserValidate =new TextEditingController();
  TextEditingController txtPwdValidate = new TextEditingController();
  validarForm(){
   return user.selectUser(txtUserValidate.text, txtPwdValidate.text); 

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey ,
      body:   
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top:80.0),
              child: Image.network("https://www.unialfa.com.br/2018/img/header-logo-unialfa.png",),
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
                  )
                ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:20.0),
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
                    )
                  ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: RaisedButton( 
                 color: Colors.teal,
                padding: EdgeInsets.all(15.0),
                  child: Text("Entrar",
                  style: TextStyle(fontSize: 20.0)
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)
                  ),
                  ),
                  onPressed: () {
                    userValidator = validarForm();
                    if (userValidator.id == null){
                      txtUserValidate.text ="";
                      txtPwdValidate.text ="";
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
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: GestureDetector(
                child: Text("Cadastre-se",
                style: TextStyle(fontSize: 20.0, color: Colors.white, decoration: TextDecoration.underline),
                ),
                onTap: () {
                  Navigator.push(
                    context, 
                    (MaterialPageRoute(
                      builder: (context) =>Cadastro1()
                      )
                    )
                    );
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