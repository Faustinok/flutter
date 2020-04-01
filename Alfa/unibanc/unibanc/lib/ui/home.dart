import 'package:flutter/material.dart';
import 'package:unibanc/user/user.dart';

import 'login.dart';

class Home extends StatelessWidget {
  User user;
  Home(this.user);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color.fromRGBO(159, 33, 29, 1.0),
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
    );
  }
}