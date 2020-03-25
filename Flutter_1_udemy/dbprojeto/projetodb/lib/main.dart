import 'package:flutter/material.dart';
import 'package:projetodb/model/Usuarios.dart';
import 'backend/dbCreate.dart'; 
int bla;
void main() async {
  var db =  new DbCreate();
  WidgetsFlutterBinding.ensureInitialized();
  int user = await db.insertUsuario(new Usuario ("gabriel","123")); 
 print("user inserido: $user");
 bla = user;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("App bd"),
        backgroundColor: Colors.cyan,
      ),
      body: Text("Usuario inserido: $bla"),
    ));
  }
}
