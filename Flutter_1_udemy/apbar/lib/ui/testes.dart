
import 'package:flutter/material.dart';

class testeappbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("home"),
        backgroundColor: Colors.blueAccent,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.archive), onPressed: null),
          IconButton(icon: Icon(Icons.audiotrack), onPressed: null),
          IconButton(icon: Icon(Icons.camera), onPressed: null),
        ],

      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.palette),title: Text("printer")),
        BottomNavigationBarItem(icon: Icon(Icons.pages),title: Text("pages"),),
      ],
      backgroundColor: Colors.deepOrangeAccent,
      ),
    );
  }

}