import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:projetodb/model/Usuarios.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbCreate {
  static final DbCreate _instance = new DbCreate.internal();
  factory DbCreate ()=> _instance;

  DbCreate.internal();
  static Database _db;
  Future<Database> get db async {
    if (_db != null ) {
      return _db;
    }
    _db = await initDb();
     return _db;
  }
  initDb() async {

    Directory documentoDiretorio = await getApplicationDocumentsDirectory();
    String  caminho = join(documentoDiretorio.path,"db_principal.db");
    var nossoDb = await openDatabase(caminho, version: 1 ,onCreate: _onCreate);
    return nossoDb;

  }
  void _onCreate (Database db, int version ) async {
     await db.execute("Create table Usuario (idUsuario integer primary key, nome text, senha text);");
  }

Future<int> insertUsuario(Usuario usuario) async {

  var dbCli = await db;
  
  int res = await dbCli.insert("Usuario", usuario.toMap());
  return res; 
}
Future<List> selectUsuario() async {
  var dbCli = await db;
  var res = await dbCli.rawQuery("select idUsuario,nome,senha from Usuario;");
  return res.toList();
}
Future<int> countUsuario() async {
  var dbCli = await db;
  return Sqflite.firstIntValue(await dbCli.rawQuery("select count(*) from Usuario"));

}
Future<int> deleteUsuario(int id) async {
   var dbCli = await db;
   var res = await dbCli.delete("Usuario",where: "idUsuario =?", whereArgs: [id]);
}
Future<Usuario> selectUsuariobyId(int id) async {
  var dbCli = await db;
  var res = await dbCli.rawQuery("select idUsuario,nome,senha from Usuario where idUsuario =$id");
  if (res.length ==0) return null;
  return new Usuario.fromMap(res.first);
}
Future<int> updateUsuario(Usuario usuario) async {
  var dbCli = await db;
  return await dbCli.update("Usuario", usuario.toMap(),where: "idUsuario =?", whereArgs: [usuario.id]);
}
Future closeDb() async {
  var dbCli = await db;
  return dbCli.close();
}
}