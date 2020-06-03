class UserModel {
  String _id;
  String _nome;
  String _sobrenome;
  String _telefone;
  String _location;
  String _endereco;
  String _picture;

UserModel.nome(this._nome,this._telefone);
UserModel.nomeSobrenome(this._nome,this._sobrenome,this._telefone);
UserModel.nomeLocation(this._nome,this._sobrenome,this._telefone,this._location,this._endereco);
UserModel.nomepicture(this._nome,this._sobrenome,this._telefone,this._picture);
UserModel.nomeall(this._nome,this._sobrenome,this._telefone,this._location,this._endereco,this._picture);

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

UserModel.toMap(){
}
UserModel.fromMap(){
}
}