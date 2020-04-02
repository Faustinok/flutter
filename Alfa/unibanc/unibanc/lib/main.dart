import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unibanc/ui/home.dart';
import 'package:unibanc/ui/login.dart';
import 'package:unibanc/ui/transferencia1.dart';
import 'package:unibanc/user/user.dart';
void main() {
  User user = new User("Gabriel", "Carvalho", 236306, "faustinoknada@gmail.com", "123", 1000.00);
  runApp(
    MaterialApp(
      title: "Unibanc",
      theme: ThemeData(
            hintColor: Colors.white),
      home: Home(user),
    )
  );
}