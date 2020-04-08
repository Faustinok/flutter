import 'package:unibanc/user/app_database.dart';
import 'package:unibanc/user/movimentacao.dart';

class MovimentacaoDao {

  Future<int> insertMov(Movimentacao mov) async {
    return initDb().then((db) {
      print("inserido");
      return db.insert("movimentacao", mov.toMap());
    });
    
  }  
}