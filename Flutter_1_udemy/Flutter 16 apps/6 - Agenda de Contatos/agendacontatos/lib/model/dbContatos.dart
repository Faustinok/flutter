import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDatabase() async {
  final String dbPath = await getDatabasesPath();
  final String path = join(dbPath, 'contato.db');

  return openDatabase(path, onCreate: (db, version) {
    db.execute("create table contato (id integer primary key,nome text,email text,telefone text,img text);");
  }, version: 1);
}
