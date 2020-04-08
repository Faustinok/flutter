import 'package:unibanc/user/app_database.dart';
import 'package:unibanc/user/user.dart';

class UserDao {



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
  Future<User> selectUserByAcount(int conta) async {
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