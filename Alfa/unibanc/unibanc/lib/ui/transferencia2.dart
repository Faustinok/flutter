import 'package:flutter/material.dart';
import 'package:unibanc/user/user.dart';

class Transferencia2 extends StatelessWidget {
  User userFrom;
  User userTo; 
  Transferencia2(this.userFrom,this.userTo);
  TextEditingController txtValor = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(159, 33, 29, 1.0),
        title: Text("Transferencia"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          
          children: <Widget>[
            Text("userFrom ${userFrom.nome} "),
            Text("userTo ${userTo.nome} "),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0,120.0,20.0,20.0),
            child: TextField(
                  controller: txtValor,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Valor",
                      labelStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      ),
                      
                ),
          ),
             Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: RaisedButton(
                  color: Color.fromRGBO(159, 33, 29, 1.0),
                  padding: EdgeInsets.all(15.0),
                  child: Text("Transferir", style: TextStyle(fontSize: 20.0)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  onPressed: () { 
                    
                  },
                ),
              ),          
          ],
        ),
      ),
    );
  }
}