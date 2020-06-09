class UserModel {
  String _useridid;
  String _nome;
  String _sobrenome;
  String _email;

  UserModel(this._nome, this._sobrenome, this._email);
  UserModel.vazio();

  get userid => _useridid;
  get nome => _nome;
  get sobrenome => _sobrenome;
  get email => _email;
  set userid(String newid) => _useridid = newid;

  UserModel.fromMap(Map map) {
    _useridid = map["id"];
    _nome = map["nome"];
    _sobrenome = map["sobrenome"];
    _email = map["email"];
  }
  Map toMap() {
    Map<String, dynamic> map = {
      "nome": nome,
      "sobrenome": sobrenome,
      "email": email,
    };
    if (userid != null) {
      map["id"] = userid;
    }
    return map;
  }
}
