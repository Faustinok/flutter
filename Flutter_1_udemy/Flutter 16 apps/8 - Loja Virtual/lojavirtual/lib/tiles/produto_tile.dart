import 'package:flutter/material.dart';
import 'package:lojavirtual/model/produtos.dart';
import 'package:lojavirtual/screens/produto_screen.dart';
class ProdutoTile extends StatelessWidget {
  final String tipo;
  final Produtos produto;
  ProdutoTile(this.tipo,this.produto);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context)=> ProdutoScreen(produto))
        );
      },
      child: Card(
        child: tipo == "grid" ?
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AspectRatio(aspectRatio: 0.8,
              child: Image.network(
                  produto.images[0],
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Text(produto.title,
                      style:  TextStyle(
                        fontWeight: FontWeight.w500
                      ),
                      ),
                      Text("R\$ ${produto.preco.toStringAsFixed(2)}",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold
                      ),
                      ),
                    ],
                  ),
                )
                )
            ],
          )
        : Row(
          children: <Widget>[
            Flexible(
              flex: 1,
              child: Image.network(
                  produto.images[0],
                  fit: BoxFit.cover,
                  height: 250.0,
                ),
                ),
            Flexible(
              flex: 1,
              child:  Container(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(produto.title,
                      style:  TextStyle(
                        fontWeight: FontWeight.w500
                      ),
                      ),
                      Text("R\$ ${produto.preco.toStringAsFixed(2)}",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold
                      ),
                      ),
                    ],
                  ),
                ))
          ],
        )
      ),
    );
  }
}