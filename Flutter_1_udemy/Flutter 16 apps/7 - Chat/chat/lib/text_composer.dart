import 'package:flutter/material.dart'; 

class TextComposer extends StatefulWidget {
  @override
  _TextComposerState createState() => _TextComposerState();
}

class _TextComposerState extends State<TextComposer> {
  bool _isComposed = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: <Widget>[
          IconButton(
            icon:Icon(Icons.camera_alt) ,
             onPressed: (){

             }
             ),
             Expanded(
               child: TextField(
                 decoration: InputDecoration.collapsed(hintText: "Digite uma mensagem"),
                 onChanged: (text){
                  setState(() {
                    _isComposed = text.isNotEmpty;
                  });                  
                 },
                 onSubmitted: (text){

                 },
               ),               
               ),
               IconButton(
                 icon: Icon(Icons.send), 
                 onPressed: () {
                   _isComposed ? (){

                   } : null;

                 }
                 )
        ],
      ),
    );
  }
}