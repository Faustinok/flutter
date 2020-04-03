import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _search;
  int _ofset = 0;
  Future<Map>_getGifs() async {
    http.Response response;
    if (_search == null) {
      response = await http.get("https://api.giphy.com/v1/gifs/trending?api_key=KE6jc3B3Y49ew5OGA6S2v3DKabaSI7jZ&limit=20&rating=G");
    } else 
    response = await http.get("https://api.giphy.com/v1/gifs/search?api_key=KE6jc3B3Y49ew5OGA6S2v3DKabaSI7jZ&q=$_search&limit=20&offset=$_ofset&rating=G&lang=en");

    return json.decode(response.body);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   print('bla');
    _getGifs().then((map){
      //print(map);
    });
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Image.network("https://developers.giphy.com/branch/master/static/header-logo-8974b8ae658f704a5b48a2d039b8ad93.gif"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: "Pesquisar",
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(),
              ),
              style: TextStyle(color: Colors.white, fontSize: 18.0),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}