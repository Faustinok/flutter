import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class User {
  int _id;
  String _nome;
  String _sobrenome;
  int _conta;
  String _email;
  String _senha;
  double _debito;

  int get id =>_id;
  String get nome =>_nome;
  String get sobrenome =>_sobrenome;
  int get conta =>_conta;
  String get email =>_email;
  String get senha =>_senha;
  double get debito =>_debito;
  
  User.vazio();
  User(this._nome,this._sobrenome,this._conta,this._email,this._senha,this._debito); 
  User.fromMap(Map map) {
    _id = map["id"];
    _nome = map["nome"];
    _sobrenome = map["sobrenome"];
    _conta = map["conta"];
    _email = map["email"];
    _senha = map["senha"];
    _debito = map["debito"];
  }
  Map toMap() {
    Map<String, dynamic> map = {
      "nome": nome,
      "sobrenome": sobrenome,
      "conta": conta,
      "email": email,
      "senha": senha,
      "debito": debito
    };
    if (id != null) {
      map["id"] = id;
    }
    return map;
  }

  initDb() async {
    final Future<Database> database = openDatabase(
      // Set the path to the database.
      join(await getDatabasesPath(), 'unibanc.db'),
      // When the database is first created, create a table to store dogs.
      onCreate: (db, version) {
        // Run the CREATE TABLE statement on the database.
        return db.execute(
            "create table usuario (id integer primary key,nome text,sobrenome text,conta double,email text,senha text,debito real,UNIQUE(email));");

        //return db.execute("create table movimentacao (id_from integer,id_to integer,dt_mov  REAL DEFAULT (datetime('now', 'localtime'),FOREIGN KEY(id_from) REFERENCES usuario(id),FOREIGN KEY(id_to) REFERENCES usuario(id))",);
      },
      version: 1,
    );
  }
  Future<void> insertUser (User user) async {
    final Database db = await initDb();
    await db.insert("usuario", user.toMap(),);
    print("inserido");
  } 
  Future<List<User>> selectUser(String email, String senha) async {
    final Database db = await initDb();
    final List<Map<String, dynamic>> maps = await db.query("usuario",where: "where email= ? and senha = ?", whereArgs: [email,senha]);

    return List.generate(maps.length, (index) {
      return User.fromMap(maps[index]);

    });
  }
}
