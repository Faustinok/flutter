import 'package:flutter/material.dart';
import 'package:unibanc/user/UserMov.dart'; 
import 'package:unibanc/user/user.dart';

class Extrato extends StatelessWidget {
  User user;
  Extrato(this.user);
  UserMov mov = new UserMov.vazio();
  List<UserMov> movimentacoes = new List();
 getMov(int id) {
 mov.selectMov(id).then((map){
   movimentacoes= map.toList();
 });
 
 }
  
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(159, 33, 29, 1.0),
        title: Text("Extrato"),
        centerTitle: true,

      ),
      body:            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: RaisedButton(
                color: Color.fromRGBO(159, 33, 29, 1.0),
                padding: EdgeInsets.all(15.0),
                child: Text("Transferir", style: TextStyle(fontSize: 20.0)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                onPressed: () {
                  getMov(user.id);
                },
              ),
            ),
    );
  }
}