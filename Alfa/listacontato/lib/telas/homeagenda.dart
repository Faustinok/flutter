import 'package:flutter/material.dart';
import 'package:listacontato/modelos/pessoas.dart';

import 'cadastro.dart';

class agendaApp extends StatefulWidget {
  @override
  _agendaAppState createState() => _agendaAppState();
}

class _agendaAppState extends State<agendaApp> {
  @override
  Widget build(BuildContext context) {
    return listaPessoas();
    //formCadastro();
    //listaPessoas();
  }
}

class listaPessoas extends StatefulWidget {
  
  @override

  _listaPessoasState createState() => _listaPessoasState();
}

class _listaPessoasState extends State<listaPessoas> {
  List<pessoa> _pessoa=  List();
   @override
  
  Widget build(BuildContext context) {
   // this._pessoa.add(pessoa("gabriel", "dev")); 
    return Scaffold(
      appBar: AppBar(
        title: Text("Contatos"),
        backgroundColor: Colors.cyan,
      ),
      body: ListView.builder(
        itemCount: this._pessoa.length,
        itemBuilder: (context,indice){
          pessoa pessoalist = this._pessoa[indice];
          return itemPessoa(pessoalist);
        },
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () { 
          Future<pessoa> future = Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return formCadastro();
            })
            );
            future.then((pessoa) {
              if (pessoa.nome.isNotEmpty && pessoa.profissao.isNotEmpty)
              this._pessoa.add(pessoa);
            });
        },
        child: const Icon(Icons.add),
        ),
    );
  }
}
class itemPessoa extends StatefulWidget {
     pessoa pessoas;
  itemPessoa(this.pessoas);
  @override
  _itemPessoaState createState() => _itemPessoaState(this.pessoas);
}

class _itemPessoaState extends State<itemPessoa> {
     pessoa _pessoa;
  _itemPessoaState(this._pessoa);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(this._pessoa.nome),
        subtitle: Text(this._pessoa.profissao),
      ),
      margin: EdgeInsets.all(0.0),
      borderOnForeground:false ,
    );
  }
}