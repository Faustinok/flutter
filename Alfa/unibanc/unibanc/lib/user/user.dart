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

  int get id => _id;
  String get nome => _nome;
  String get sobrenome => _sobrenome;
  int get conta => _conta;
  String get email => _email;
  String get senha => _senha;
  double get debito => _debito;

  User.vazio();
  User(this._nome, this._sobrenome, this._conta, this._email, this._senha,this._debito);
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

  static Database _db;
  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  Future<Database> initDb() async {
    return getDatabasesPath().then((dbPath) {
      final String path = join(dbPath, 'unialfabanc.db');
      return openDatabase(
        // Set the path to the database.
        join(path, 'unibanc.db'),
        // When the database is first created, create a table to store dogs.
        onCreate: (db, version) {
          // Run the CREATE TABLE statement on the database.
          return db.execute(
              "create table usuario (id integer primary key,nome text,sobrenome text,conta integer,email text,senha text,debito real,UNIQUE(email)); create table movimentacao(id_from integer,id_to integer,valor REAL,dt_mov  REAL DEFAULT (datetime('now', 'localtime')),FOREIGN KEY(id_from) REFERENCES usuario(id),FOREIGN KEY(id_to) REFERENCES usuario(id));");
        },
        version: 1,
      );
    });
  }

  Future<int> insertUser(User user) async {
    return initDb().then((db) {
      print("inserido");
      return db.insert("usuario", user.toMap());
    });
    
  }

  Future<User> selectUserByLogin(String email, String senha) async {
    var client = await db;
    User user;
    final Future<List<Map<String, dynamic>>> futureMaps = client.query(
        'usuario',
        where: 'email = ? and senha =?',
        whereArgs: [email, senha]);
    var maps = await futureMaps;
    if (maps.length != 0) {
      user =User.fromMap(maps.first);
      print(user.nome);
      return user;      
    } else {
      return null;
    } 
     
  }
  Future<User> selectUserById(int idd) async {
    var client = await db;
    User user;
    final Future<List<Map<String, dynamic>>> futureMaps = client.query(
        'usuario',
        where: 'id = ?',
        whereArgs: [idd]);
    var maps = await futureMaps;
    if (maps.length != 0) {
      user =User.fromMap(maps.first);
      print(user.nome);
      return user;      
    } else {
      return null;
    } 
     
  }
  Future<User> selectUserByAcount(String email, String senha) async {
    var client = await db;
    User user;
    final Future<List<Map<String, dynamic>>> futureMaps = client.query(
        'usuario',
        where: 'conta = ?',
        whereArgs: [conta]);
    var maps = await futureMaps;
    if (maps.length != 0) {
      user =User.fromMap(maps.first);
      print(user.nome);
      return user;      
    } else {
      return null;
    } 
     
  }
  Future<int> updatetUser(User user) async {
    return initDb().then((db) {
      print("alterado");
      return db.update("usuario", user.toMap(),where: "id = ?",whereArgs: [user.id]);
    });
    
  }    
   
}
