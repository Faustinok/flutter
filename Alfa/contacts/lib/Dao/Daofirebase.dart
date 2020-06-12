import 'dart:io';

import 'package:contacts/components/preferences.dart';
import 'package:contacts/model/contatoModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contacts/model/userModel.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:path/path.dart' as path;

class FirebaseDao {
  FirebaseDao.vazio();
  FirebaseAuth authentication = FirebaseAuth.instance;
  FirebaseUser firebaseUser;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  UserModel userModel = UserModel.vazio();
  final databaseReference = Firestore.instance;

  cadastroUser({@required UserModel userModel, @required String senha}) async {
    authentication
        .createUserWithEmailAndPassword(email: userModel.email, password: senha)
        .then((onValue) async {
      firebaseUser = onValue.user;
      await _salveFireBase(userModel);
      return firebaseUser.uid;
    }).catchError((onError) {
      print("deu erro");
    });
  }

  loginGoogle() async {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
    final AuthCredential credencial = GoogleAuthProvider.getCredential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);
    final AuthResult authResult =
        await authentication.signInWithCredential(credencial);
    final FirebaseUser user = authResult.user;
    print(user.providerData);
    var namesplit = user.displayName.split(" ");
    UserModel userModel = UserModel(namesplit[0], namesplit[1], user.email);
    firebaseUser = user;
    final snapShot = await Firestore.instance
        .collection('users')
        .document(firebaseUser.uid)
        .get();

    if (snapShot == null || !snapShot.exists) {
      _salveFireBase(userModel);
      return userModel;
    } else {
      DocumentSnapshot docUser = await Firestore.instance
          .collection("users")
          .document(firebaseUser.uid)
          .get();

      userModel = UserModel.fromMap(docUser.data);
      userModel.userid = firebaseUser.uid;
      return userModel;
    }
  }

  login({@required String email, @required String senha}) async {
    AuthResult userAtuh;
    try {
      userAtuh = await authentication.signInWithEmailAndPassword(
          email: email, password: senha);
      firebaseUser = userAtuh.user;
      DocumentSnapshot docUser = await Firestore.instance
          .collection("users")
          .document(firebaseUser.uid)
          .get();
      userModel = UserModel.fromMap(docUser.data);
      userModel.userid = firebaseUser.uid;
      return userModel;
    } catch (error) {
      print(error.toString());
    }
  }

  Future<Null> _salveFireBase(UserModel userModel) async {
    await Firestore.instance
        .collection("users")
        .document(firebaseUser.uid)
        .setData(userModel.toMap());
  }

  Future<Null> criarContato(ContatoModel contatoModel, String uid) async {
    print("blaaaaaaaaaaaaaaaaaaaaaaah");
    await Firestore.instance
        .collection("users")
        .document(uid)
        .collection("contatos")
        .document()
        .setData(contatoModel.toMap());
  }

  Future<UserModel> getUser(String uid) async {
    DocumentSnapshot docUser =
        await Firestore.instance.collection("users").document(uid).get();
    userModel = UserModel.fromMap(docUser.data);
    userModel.userid = uid;
    return userModel;
  }

  logout() async {
    await FirebaseAuth.instance.signOut();
    LocalStorage.setValue<String>('userId', "");
  }

  updateFirebase(String uid, String docid, ContatoModel contatoModel) {
    try {
      databaseReference
          .collection('users')
          .document(uid)
          .collection('contatos')
          .document(docid)
          .updateData(contatoModel.toMap());
    } catch (e) {
      print(e.toString());
    }
  }

  Future sendImage(
      String pictureFile, String contatoid, String contatoPicture) async {
    if (contatoPicture.isNotEmpty) {
      StorageReference storageReferencedel =
          FirebaseStorage.instance.ref().child('$contatoPicture');
      await storageReferencedel.delete();
    }

    StorageReference storageReference = FirebaseStorage.instance
        .ref()
        .child('$contatoid/${path.basename(pictureFile)}');
    StorageUploadTask uploadTask = storageReference.putFile(File(pictureFile));
    await uploadTask.onComplete;

    print(storageReference.path);
    List<String> dados = List();
    String image = await storageReference.getPath();
    String url = await storageReference.getDownloadURL();
    await uploadTask.onComplete;
    dados.add(image);
    dados.add(url);
    print("image uploaded");
    //print(image);
    //print(url);
    return dados;
  }
}
