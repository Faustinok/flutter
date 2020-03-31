import 'package:flutter/material.dart';
import 'package:unibanc/user/user.dart';

class Home extends StatelessWidget {
  User user;
  Home(this.user);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.nome),
      ),
    );
  }
}