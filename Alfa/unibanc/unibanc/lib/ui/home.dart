import 'package:flutter/material.dart';
import 'package:unibanc/ui/transferencia1.dart';
import 'package:unibanc/user/user.dart';

import 'login.dart';

class Home extends StatelessWidget {
  User user;
  Home(this.user);

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(159, 33, 29, 1.0),
          title: Text(user.nome),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                icon: Icon(Icons.power_settings_new),
                onPressed: () {
                  Navigator.push(context,
                      (MaterialPageRoute(builder: (context) => Login())));
                },
              ),
            )
          ],
        ),
        body: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                    height: 70,
                    width: 180,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 0.5,
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.attach_money,
                          color: Colors.white,
                          size: 35,
                        ),
                        Text(
                          user.debito.toString(),
                          style: TextStyle(fontSize: 32),
                        )
                      ],
                    )),
                Container(
                    height: 70,
                    width: 180,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 0.5,
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Conta ",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          user.conta.toString(),
                          style: TextStyle(fontSize: 32),
                        )
                      ],
                    )),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 50),
              child: Card(
                child: ListTile(
                  title: Text("Transferencia"),
                  onTap: () {
                    Navigator.push(
                        context,
                        (MaterialPageRoute(
                            builder: (context) => Transferencia1()
                            )
                        )
                      );
                  },
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: Text("Extrato"),
              ),
            ),
            Card(
              child: ListTile(
                title: Text("Perfil"),
              ),
            ),
          ],
        ));
  }
}
