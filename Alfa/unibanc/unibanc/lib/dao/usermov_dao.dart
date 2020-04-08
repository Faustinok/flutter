import 'package:unibanc/user/UserMov.dart';
import 'package:unibanc/user/app_database.dart';

class userMovDao {
   Future<List<UserMov>>selectMov(int id) async {
    return initDb().then((db){
      db.rawQuery("select user_From.nome as nomeFrom, user_to.nome as nomeTo, mov.valor as valor, date(dt_mov) as dataMov, 0 as tipo from usuario user_From inner join movimentacao mov on user_From.id =mov.id_from inner join usuario user_to on user_to.id =mov.id_to where user_From.id = $id "
).then((maps){
  List<UserMov> movimentacoes = List();
    for (Map<String, dynamic> map in maps) { 
      movimentacoes.add(UserMov.fromMap(map));
    }
    print(movimentacoes[0].date);
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