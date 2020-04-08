import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart'; 
  Database _db;
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
           db.execute("create table usuario (id integer primary key,nome text,sobrenome text,conta integer,email text,senha text,debito real,UNIQUE(email)); ");
           db.execute("create table movimentacao(id_from integer,id_to integer,valor REAL,dt_mov  REAL DEFAULT (datetime(\'now\', \'localtime\')),FOREIGN KEY(id_from) REFERENCES usuario(id),FOREIGN KEY(id_to) REFERENCES usuario(id));");
        },
        version: 1,
      );
    });
  }