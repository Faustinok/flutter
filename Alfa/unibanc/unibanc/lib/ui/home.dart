import 'package:flutter/material.dart';
import 'package:unibanc/user/user.dart';

class Home extends StatelessWidget {
  User user;
  Home(this.user);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color.fromRGBO(159, 33, 29, 1.0),
        title: Text(user.nome),
      ),
    );
  }
}