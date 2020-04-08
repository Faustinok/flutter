import 'package:flutter/material.dart';
import 'package:unibanc/dao/user_dao.dart';
import 'package:unibanc/ui/transferencia2.dart';
import 'package:unibanc/user/user.dart';

class Transferencia1 extends StatelessWidget {
  User userfrom;
  User userTo;
  UserDao _dao = UserDao();
  Transferencia1(this.userfrom);
  getUserTo(BuildContext context, int nconta) async {
    userTo = await _dao.selectUserByAcount(nconta);
    if (userTo == null) {
      txtContaDestino.text = "";
    } else {
      Navigator.push(
          context,
          (MaterialPageRoute(
              builder: (context) => Transferencia2(userfrom, userTo)
              )
           )
        );
    }
  }

  TextEditingController txtContaDestino = new TextEditingController();
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
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 120.0, 20.0, 20.0),
              child: TextField(
                controller: txtContaDestino,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Conta de destino",
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
                child: Text("Proximo", style: TextStyle(fontSize: 20.0)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                onPressed: () {
                  int conta = int.parse(txtContaDestino.text);
                  getUserTo(context,conta);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
