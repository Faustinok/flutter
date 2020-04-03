
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:giffind/ui/home_page.dart'; 

void main(){
  runApp(
   MaterialApp(
     theme: ThemeData(hintColor: Colors.white,),
     title:"Gif find",
     home: HomePage(),
   )
  );
}