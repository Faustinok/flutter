import 'package:flutter/material.dart';

import 'cadastro2.dart';

class Cadastro1 extends StatelessWidget {
  TextEditingController txtFieldEmail =new TextEditingController(); 
  TextEditingController txtFieldNome=new TextEditingController();  
  validarForm(){

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey ,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(159, 33, 29, 1.0),//Colors.teal,
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
                controller: txtFieldEmail,
                decoration: InputDecoration(
                  labelText: "Email",
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
                  controller: txtFieldNome,    
                  decoration: InputDecoration(
                    labelText: "Nome",
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
                 color: Color.fromRGBO(159, 33, 29, 1.0),//Colors.teal,
                padding: EdgeInsets.all(15.0),
                  child: Text("Proximo",
                  style: TextStyle(fontSize: 20.0)
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)
                  ),
                  ),
                  onPressed: () {
                    print(txtFieldEmail.text);
                    print(txtFieldNome.text);
                    Navigator.push(
                      context, 
                      (MaterialPageRoute(
                        builder: (context) =>Cadastro2(txtFieldEmail.text,txtFieldNome.text)
                        )
                      )
                      );
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