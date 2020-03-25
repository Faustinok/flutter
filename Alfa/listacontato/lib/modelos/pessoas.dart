class pessoa {
  int _id;
  String _nome;
  String _profissao;
  String get nome => _nome;

  set id(int id) {
    _id = id;
  }

int get id => _id;
  set nome(String nome) {
    _nome = nome;
  }

  String get profissao => _profissao;

  set profissao(String profissao) {
    _profissao = profissao;
  }

  pessoa(this._nome, this._profissao);
  
  pessoa.map(dynamic obj) {
    this._id =  obj['id'];
    this._nome =  obj['nome'];
    this._profissao =  obj['profissao'];
  }

  Map<String, dynamic> tomap() {
    var mapa = new Map<String, dynamic>();
    mapa['nome'] = _nome;
    mapa['profissao'] = _profissao; 
    if (id != null ) {
       mapa['id'] = _id;
    }
    return mapa;
  }
  pessoa.fromMap(Map<String, dynamic>mapa) {
    this._id =mapa['id'];
    this._nome =mapa['nome'];
    this._profissao =mapa['profissao'];
  }

}
