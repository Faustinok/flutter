import 'package:contacts/screens/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Contacts());
}

class Contacts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Contacts",
      home: Login(),
    );
  }
}
