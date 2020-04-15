import 'package:flutter/material.dart';
import 'package:lojavirtual/model/produtos.dart';
class ProdutoScreen extends StatefulWidget {
  Produtos produto;
  ProdutoScreen(this.produto);
  @override
  _ProdutoScreenState createState() => _ProdutoScreenState(produto);
}

class _ProdutoScreenState extends State<ProdutoScreen> {
  Produtos produto;
  _ProdutoScreenState(this.produto);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(produto.title),
        centerTitle: true,
      ),
    );
  }
}