import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'contato.dart';

class ContatoDb {
  static final ContatoDb _instance = ContatoDb.internal();
  factory ContatoDb() => _instance;
  
  ContatoDb.internal();

  Database _db;
  get db async {
    if (_db != null ) {
      return _db;
    } else {
      _db = await initDb();
    }
  }
  Future<Database> initDb() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath,'contato.db'); 

    return await openDatabase(path,version: 1,onCreate: (Database db, int newerVersion )async {
      await db.execute("create table contato (id integer primary key,nome text,email text,telefone text,img text);");
    });
  }
  Future<int> saveContato(Contato contato) async {
    Database cli = await db;
    return  await  cli.insert("contato", contato.toMap());
     
  }
  Future<Contato> selectContatobyId(int id) async {
    Database cli = await db;
    Contato contato;
  List<Map> map = await cli.query("contato",
  columns: ["id","nome","email","telefone","img"]
  ,where: "id = ?"
  ,whereArgs: [id]);
  if (map.length >0){
    contato = Contato.fromMap(map.first);
    return contato;
  } else {
    return null;
  }
    
  }
  Future<int> deleteContatoById (int id) async {
    Database cli = await db;
    return await cli.delete("contato",where: "id =?",whereArgs: [id]);
  }
  Future<int> updateContato(Contato contato) async {
    Database cli = await db;
    return await cli.update("contato", contato.toMap(),where: "id =?", whereArgs: [contato.id]);
  }
  Future<List<Contato>> selectContatos() async {
    Database cli = await db;
    List<Contato> contatos = List();
    Contato contato ;
    final Future<List<Map<String, dynamic>>> futureMaps =cli.query("contato");
    var maps = await futureMaps;
      if (maps.length != null && maps.length > 0 ) {
        for (Map<String, dynamic> map in maps) {
          contato = Contato.fromMap(map);
          contatos.add(contato);
        }
        return contatos;
      }
  }
}