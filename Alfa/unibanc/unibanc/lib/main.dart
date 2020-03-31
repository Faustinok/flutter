import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unibanc/ui/login.dart';
void main() {
  runApp(
    MaterialApp(
      title: "Unibanc",
      theme: ThemeData(
            hintColor: Colors.white),
      home: Login()
    )
  );
}