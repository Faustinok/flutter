class Usuario {
  int _id;
  String _nome;
  String _senha; 

  Usuario(this._nome,this._senha);
  Usuario.map(dynamic obj) {
    this._id =obj['nome'];
    this._nome =obj['nome'];
    this._senha =obj['nome'];
  }
  
  int get id => _id;
  String get nome =>_nome;
  String get senha =>_senha;

    Map<String, dynamic> toMap(){
      var jsonUsuario = new Map<String, dynamic>();

      jsonUsuario["nome"] =_nome;
      jsonUsuario["senha"] =_senha;

      if (id != null ){
        jsonUsuario["id"] =_id;
      }
      return jsonUsuario;
    }
    Usuario.fromMap(Map<String, dynamic>jsonUsuario) {
      this._id = jsonUsuario["id"];
      this._nome = jsonUsuario["nome"];
      this._senha = jsonUsuario["senha"];
    }
}
