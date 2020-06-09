class ContatoModel {
  String _useridid;
  String _nome;
  String _sobrenome;
  String _telefone;
  String _location;
  String _endereco;
  String _picture;

ContatoModel.nome(this._nome,this._telefone);
ContatoModel.nomeSobrenome(this._nome,this._sobrenome,this._telefone);
ContatoModel.nomeLocation(this._nome,this._sobrenome,this._telefone,this._location,this._endereco);
ContatoModel.nomepicture(this._nome,this._sobrenome,this._telefone,this._picture);
ContatoModel.nomeall(this._nome,this._sobrenome,this._telefone,this._location,this._endereco,this._picture);

get userid => _useridid;
get nome => _nome;
get sobrenome => _sobrenome;
get telefone => _telefone;
get location => _location;
get endereco => _endereco;
get picture => _picture;

set nome (String newnome) => _nome = newnome;
set sobrenome (String newsobrenome) => _nome = newsobrenome;
set telefone (String newtelefone) => _telefone = newtelefone;
set location (String newlocation) => _location = newlocation;
set endereco (String newendereco) => _endereco = newendereco;
set picture (String newpicture) => _picture = newpicture;

ContatoModel.fromMap(Map map){
  _useridid = map["id"];
  _nome = map["nome"];
  _sobrenome = map["sobrenome"];
  _telefone = map["telefone"];
  _location = map["location"];
  _endereco = map["endereco"];
  _picture = map["picture"];
}
  Map toMap() {
    Map<String, dynamic> map = {
      "nome": nome,
      "sobrenome": sobrenome,
      "telefone": telefone,
      "location": location,
      "endereco": endereco,
      "picture": picture
    };
    if (userid != null) {
      map["id"] = userid;
    }
    return map;
  }   
}