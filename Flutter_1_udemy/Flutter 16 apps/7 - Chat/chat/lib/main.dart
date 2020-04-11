import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
void main(){
  Firestore.instance.collection("col").document("doc").setData({"texto": "Gabriel"});

  runApp(MaterialApp(
    title: "Chat",
    home: Container(),
  ));
}