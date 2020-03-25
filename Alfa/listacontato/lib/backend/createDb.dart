import 'dart:io';
import 'package:listacontato/modelos/pessoas.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbBackEnd {
  static final DbBackEnd _instance = new DbBackEnd.internal();

  factory DbBackEnd() => _instance;
  final String tabelaPessoa = "tabelaPessoa";
  final String colidPessoa = "idPessoa";
  final String colnome = "nome";
  final String colprofissao = "profissao";

  static Database _db;
  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();

  }
DbBackEnd.internal();
  initDb() async {

    Directory documentoDiretorio = await getApplicationDocumentsDirectory();
    String caminho = documentoDiretorio.path + "db_bla.db";
    var meuDb = await openDatabase(caminho,version: 1, onCreate: _onCreate);
    
      }
    
     void _onCreate (Database db, int version) async {
      await db.execute("CREATE TABLE Pessoa (idPessoa INTEGER, nome TEXT, profissao TEXT);");
}

  Future<int> insertPessoa (pessoa pessoaS) async {
    var dbCLi = await db;
    int res = await dbCLi.insert("Pessoa", pessoaS.tomap());
    return res;
  }
  Future<List> selectPessoa() async {
    var dbCli = await db;
    var res = await dbCli.rawQuery("select idPessoa,nome,profissao from  Pessoa;");
    return res.toList();
  }
  Future<int> countPessoa() async {
    var dbCli = await db;
    return Sqflite.firstIntValue( await dbCli.rawQuery("select count(*) from Pessoa;"));
  }

  Future<pessoa> selectPessoabyId(int id) async {
    var dbCli = await db;
    var res = await dbCli.rawQuery("select idPessoa,nome,profissao from  Pessoa where idPessoa = $id;");
    if (res.length ==0 ) return null;
    return new pessoa.fromMap(res.first);
  }
  Future<int> deletePessoabyId (int id) async {
    var dbCli = await db;

    return await dbCli.delete("Pessoa", where: "idPessoa = ?",whereArgs:[id]);
  }

  Future<int> updatePessoabyId (pessoa pessoaS) async {
    var dbCli = await db;
    
    return await dbCli.update("Pessoa", pessoaS.tomap(),where:"idPessoa = ?", whereArgs: [pessoaS.id]);

  }

  Future closeDb() async {
    var dbCli = await db;
    return dbCli.close();

  }
 
    }
     