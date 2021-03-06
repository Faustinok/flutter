class Contato {
  int _id;
  String _nome;
  String _email;
  String _telefone;
  String _img;
  Contato.vazio();
  Contato(this._nome, this._email,this._telefone, this._img);
  get id => _id;
  get nome => _nome;
  get email => _email;
  get telefone => _telefone;
  get img => _img;
  void set nome(String novoNome) {
    _nome = novoNome;
  }
  void set email(String novoEmail) {
    _email = novoEmail;
  }  
  void set telefone(String novoTelefone) {
    _telefone = novoTelefone;
  }  
  void set img(String novoimg) {
    _img = novoimg;
  }   
    void set id(int novoid) {
    _id = novoid;
  }
  Contato.fromMap(Map map) {
    _id = map["id"];
    _nome = map["nome"];
    _email = map["email"];
    _telefone = map["telefone"];
    _img = map["img"];
  }
  Map toMap() {
    Map<String, dynamic> map = {
      "nome": _nome,
      "email": _email,
      "telefone": _telefone,
      "img": _img
    };
    if (_id != null) {
      map["id"] = _id;
    }
    return map;
  }
}
