import 'dart:io';

import 'package:chat/text_composer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
class ChatScreen extends StatefulWidget {
  @override 
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final GoogleSignIn google = GoogleSignIn() ;
  final GlobalKey<ScaffoldState> _scafoldKey = GlobalKey<ScaffoldState>();
  FirebaseUser _currentUser;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    FirebaseAuth.instance.onAuthStateChanged.listen((user){
      _currentUser = user;

    });
  }

  Future<FirebaseUser> _getUser() async {
    if (_currentUser != null) return _currentUser;
    try  {  

      final GoogleSignInAccount googleaccount = await google.signIn();
      final GoogleSignInAuthentication googleauth = await googleaccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: googleauth.idToken,
        accessToken: googleauth.accessToken
      );
      
      final AuthResult authResult =
      await FirebaseAuth.instance.signInWithCredential(credential);
      final FirebaseUser user = authResult.user;
      print("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH ${_currentUser}");
    return user;
    }catch(error) {
      print("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH${error}");
    }
  }
  
  _sendMessage({String text, File imageFile}) async {    

    final FirebaseUser user = await _getUser();
    if (user == null ) {
      SnackBar(content: Text("nao foi possivel fazer o login tente novamente"),backgroundColor:  Colors.red,);
    }

  Map<String, dynamic> data = 
  {
    "uid": user.uid,
    "name": user.displayName,
    "senderPhotoUrl": user.photoUrl,
  };
    if (imageFile != null) {
      StorageUploadTask task = FirebaseStorage.instance
          .ref()
          .child(DateTime.now().millisecondsSinceEpoch.toString())
          .putFile(imageFile);
      StorageTaskSnapshot snapshot = await task.onComplete;
      String url = await snapshot.ref.getDownloadURL();  
      data["imgurl"] =url;
    }
    if (text != null) data["text"]= text;
      Firestore.instance.collection("messages").add(data);
    
    
  }

  @override
  


  Widget build(BuildContext context) {
    return Scaffold(
      key: _scafoldKey,
      appBar: AppBar(
        title: Text("App Chat"),
      ),
      body: 
      Column(
        children: <Widget>[
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: Firestore.instance.collection("messages").snapshots(),
              builder: (context,snapshot){
                switch  (snapshot.connectionState){
                  case ConnectionState.none:
                    case ConnectionState.waiting:
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                  default: 
                    List<DocumentSnapshot> documents =snapshot.data.documents.reversed.toList();
                    return ListView.builder(
                      itemCount: documents.length,
                      reverse: true,
                      itemBuilder: (contex, index){
                        return ListTile(
                          title: Text(documents[index].data["text"]),
                        );
                      },
                    );
                }
              }
              ),
            ),          
          TextComposer(_sendMessage),
        ],
      )
    );
  }
}
