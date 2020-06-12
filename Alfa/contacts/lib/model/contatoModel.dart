import 'package:flutter/material.dart';

class ContatoModel {
  String _contatoid;
  String _nome;
  String _sobrenome;
  String _telefone;
  String _email;
  String _location;
  String _endereco;
  String _picture;
  String _url;

  ContatoModel.nome(this._nome, this._telefone);
  ContatoModel.nomeSobrenome(this._nome, this._sobrenome, this._telefone);
  ContatoModel.nomeLocation(this._nome, this._sobrenome, this._telefone,
      this._location, this._endereco);
  ContatoModel.nomepicture(
      this._nome, this._sobrenome, this._telefone, this._picture);
  ContatoModel.nomeall(this._nome, this._sobrenome, this._telefone, this._email,
      this._location, this._endereco, this._picture, this._url);
  ContatoModel.vazio();

  get contatoid => _contatoid;
  get nome => _nome;
  get sobrenome => _sobrenome;
  get telefone => _telefone;
  get location => _location;
  get endereco => _endereco;
  get picture => _picture;
  get email => _email;
  get url => _url;

  set nome(String newnome) => _nome = newnome;
  set sobrenome(String newsobrenome) => _sobrenome = newsobrenome;
  set telefone(String newtelefone) => _telefone = newtelefone;
  set location(String newlocation) => _location = newlocation;
  set endereco(String newendereco) => _endereco = newendereco;
  set picture(String newpicture) => _picture = newpicture;
  set email(String newemail) => _email = newemail;
  set contatoid(String newid) => _contatoid = newid;
  set url(String newurl) => _url = newurl;
  ContatoModel.fromMap(Map map) {
    _contatoid = map["id"];
    _nome = map["nome"];
    _sobrenome = map["sobrenome"];
    _telefone = map["telefone"];
    _email = map["email"];
    _location = map["location"];
    _endereco = map["endereco"];
    _picture = map["picture"];
    _url = map["url"];
  }
  Map toMap() {
    Map<String, dynamic> map = {
      "nome": nome,
      "sobrenome": sobrenome,
      "telefone": telefone,
      "email": email,
      "location": location,
      "endereco": endereco,
      "picture": picture,
      "url": _url
    };
    if (contatoid != null) {
      map["id"] = _contatoid;
    }
    return map;
  }
}
