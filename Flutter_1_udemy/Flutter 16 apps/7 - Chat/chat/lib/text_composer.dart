import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; 
import 'dart:io';

class TextComposer extends StatefulWidget {
    TextComposer(this.sendMessage);
  Function({String text, File imageFile})  sendMessage;

  @override
  _TextComposerState createState() => _TextComposerState();
}

class _TextComposerState extends State<TextComposer> {

  TextEditingController txtmsg = TextEditingController();
  bool _isComposed = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: <Widget>[
          IconButton(
            icon:Icon(Icons.camera_alt) ,
             onPressed: ()async {
               final File imgFiles = await  ImagePicker.pickImage(source: ImageSource.camera);
               if (imgFiles == null ) return;
                widget.sendMessage(imageFile:imgFiles);
             }
             ),
             Expanded(
               child: TextField(
                 controller: txtmsg,
                 decoration: InputDecoration.collapsed(hintText: "Digite uma mensagem"),
                 onChanged: (text){
                  setState(() {
                    _isComposed = text.isNotEmpty;
                  });                  
                 },
                 onSubmitted: (text){
                   widget.sendMessage(text:text);
                   txtmsg.text="";
                   setState(() {
                     _isComposed = false;
                   });
                 },
               ),               
               ),
               IconButton(
                 icon: Icon(Icons.send), 
                 onPressed: () {
                   if (_isComposed){

                     setState(() {
                       _isComposed = false;
                       widget.sendMessage(text: txtmsg.text);
                      txtmsg.text="";
                     });
                   } else return null;

                 }
                 )
        ],
      ),
    );
  }
}