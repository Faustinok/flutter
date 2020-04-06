import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
class UserMov {

String _nomeFrom;
String _nomeTo;
double _valor;
String _date;
int _tipo;

get nomeFrom =>_nomeFrom;
get nomeTo =>_nomeTo;
get valor =>_valor;
get date =>_date;
get tipo =>_tipo;

UserMov.vazio();
UserMov(this._nomeFrom,this._nomeTo,this._valor,this._date,this._tipo);

UserMov.fromMap(Map map) {
 _nomeFrom = map["nomeFrom"];
 _nomeTo =   map["nomeTo"];
 _valor =    map["valor"];
 _date =     map["dataMov"];
 _tipo =     map["tipo"];
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
           db.execute("create table usuario (id integer primary key,nome text,sobrenome text,conta integer,email text,senha text,debito real,UNIQUE(email)); ");
           db.execute("create table movimentacao(id_from integer,id_to integer,valor REAL,dt_mov  REAL DEFAULT (datetime(\'now\', \'localtime\')),FOREIGN KEY(id_from) REFERENCES usuario(id),FOREIGN KEY(id_to) REFERENCES usuario(id));");
        },
        version: 1,
      );
    });
  }

  Future<List<UserMov>>selectMov(int id) async {
    return initDb().then((db){
      db.rawQuery("select user_From.nome as nomeFrom, user_to.nome as nomeTo, mov.valor as valor, date(dt_mov) as dataMov, 0 as tipo from usuario user_From inner join movimentacao mov on user_From.id =mov.id_from inner join usuario user_to on user_to.id =mov.id_to where user_From.id = $id "
).then((maps){
  List<UserMov> movimentacoes = List();
    for (Map<String, dynamic> map in maps) { 
      movimentacoes.add(UserMov.fromMap(map));
    }
    print(movimentacoes[0]._date);
    return movimentacoes;
});
    });
         
  }
     Future<int> selectCount() async {
    var client = await db; 
    int bla;
    
    final Future<List<Map<String, dynamic>>> futureMaps =  client.rawQuery("select count(*) as conta from movimentacao;") ;
    var maps = await futureMaps;
    if(maps.length !=0 ) {
      bla = maps[0]["conta"];
      return bla;
    }
     
  }
       Future<List<UserMov>> selectMov2(int id) async {
    var client = await db; 
    int bla;
    UserMov usermov;
    final Future<List<Map<String, dynamic>>> futureMaps =  client.rawQuery("select user_From.nome as nomeFrom, user_to.nome as nomeTo, mov.valor as valor, date(dt_mov) as dataMov, 0 as tipo from usuario user_From inner join movimentacao mov on user_From.id =mov.id_from inner join usuario user_to on user_to.id =mov.id_to where user_From.id = $id union all select user_From.nome as nomeFrom, user_to.nome as nomeTo, mov.valor as valor, date(dt_mov) as dataMov, 1 as tipo from usuario user_From inner join movimentacao mov on user_From.id =mov.id_from inner join usuario user_to on user_to.id =mov.id_to where user_to.id = $id order by dataMov;") ;
    var maps = await futureMaps;
    List<UserMov> movimentacoes = List();
    if(maps.length !=0 ) {
      for (Map<String, dynamic> map in maps) {   
      usermov = UserMov.fromMap(map);
      movimentacoes.add(usermov);
      }
      return movimentacoes;
    }
     
  }
}