 import 'package:chat/chat_screen.dart';
import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(
    title: "Chat",
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.blue,
      iconTheme: IconThemeData(
        color: Colors.blue
      )
    ),
    home: ChatScreen(),
  ));
}