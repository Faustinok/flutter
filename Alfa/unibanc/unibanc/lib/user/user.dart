import 'dart:async';

import 'app_database.dart';

class User {
  int _id;
  String _nome;
  String _sobrenome;
  int _conta;
  String _email;
  String _senha;
  double _debito;

  int get id => _id;
  String get nome => _nome;
  String get sobrenome => _sobrenome;
  int get conta => _conta;
  String get email => _email;
  String get senha => _senha;
  double get debito => _debito;
  set debito(double valor) {
    _debito= valor;
  }

  User.vazio();
  User(this._nome, this._sobrenome, this._conta, this._email, this._senha,this._debito);
  User.fromMap(Map map) {
    _id = map["id"];
    _nome = map["nome"];
    _sobrenome = map["sobrenome"];
    _conta = map["conta"];
    _email = map["email"];
    _senha = map["senha"];
    _debito = map["debito"];
  }
  Map toMap() {
    Map<String, dynamic> map = {
      "nome": nome,
      "sobrenome": sobrenome,
      "conta": conta,
      "email": email,
      "senha": senha,
      "debito": debito
    };
    if (id != null) {
      map["id"] = id;
    }
    return map;
  }    
   
}
