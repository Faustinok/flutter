
import 'package:agendacontatos/model/dbContatos.dart';
import 'package:sqflite/sqflite.dart';
import 'contato.dart';
class ContatoDao  {
Future<int> saveContato(Contato contato) async {
    Database cli = await createDatabase();
    return  await  cli.insert("contato", contato.toMap());
     
  }
  Future<Contato> selectContatobyId(int id) async {
    Database cli = await createDatabase();
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
    Database cli = await createDatabase();
    return await cli.delete("contato",where: "id =?",whereArgs: [id]);
  }
  Future<int> updateContato(Contato contato) async {
    Database cli = await createDatabase();
    return await cli.update("contato", contato.toMap(),where: "id =?", whereArgs: [contato.id]);
  }
  Future<List<Contato>> selectContatos() async {
    Database cli = await createDatabase();
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