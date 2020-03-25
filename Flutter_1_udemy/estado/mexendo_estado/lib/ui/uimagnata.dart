 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

 
class HomeMagnata extends StatefulWidget{
  
  @override 
  _MagnataState createState()=> _MagnataState();   
}
class _MagnataState extends State<HomeMagnata> {
  int _valor =0;
  void _incrementValor (){
    setState(() {
       _valor +=100;
    }); 
  }
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Magnata"),
        backgroundColor: Colors.lightGreen,
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: Text("Fique rico!",
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w400,
              fontSize: 29.9
            ),
            )
          ),
          Expanded(child: Center(
            child: Text("\$ $_valor",
            style: TextStyle(
              fontSize: 40.0,
              color: Colors.green
            ),
            ),
          ),
          ),
          Expanded(child: Center(
            child: FlatButton(
              onPressed: ()=> _incrementValor(),
             child: Text("clique!"),
             color: Colors.green,)
          ),
          ),
        ],
      ),
    );
  }
}