import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lojavirtual/model/produtos.dart';
import 'package:lojavirtual/tiles/produto_tile.dart';

class ProdutoCategoria extends StatelessWidget {
  final DocumentSnapshot snapshot;
  ProdutoCategoria(this.snapshot);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
       child: Scaffold(
         appBar: AppBar(
           title: Text(snapshot.data["title"]),
           centerTitle: true,
           bottom: TabBar(
             indicatorColor: Colors.white,
             tabs: <Widget> [
               Tab(icon: Icon(Icons.grid_on)),
               Tab(icon: Icon(Icons.list))
             ]
             ),
         ),
         body: FutureBuilder<QuerySnapshot>(
           future: Firestore.instance.collection("produtos").document(snapshot.documentID).collection("itens").getDocuments(),
           builder: (context,snapshotItens){
             if(!snapshotItens.hasData) {
               return Center(child: CircularProgressIndicator());
             }else {
               return  TabBarView(
           physics: NeverScrollableScrollPhysics(),
           children: [
             GridView.builder(
               padding: EdgeInsets.all(4.0),               
               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                 crossAxisCount: 2,
                 mainAxisSpacing: 4.0,
                 crossAxisSpacing: 4.0,
                 childAspectRatio: 0.65
                 ),
                itemCount: snapshotItens.data.documents.length,
                itemBuilder: (context, index) {
                  return ProdutoTile("grid",Produtos.fromDocument(snapshotItens.data.documents[index]));
                }
                ),
             ListView.builder(
               padding: EdgeInsets.all(4.0),
               itemCount: snapshotItens.data.documents.length,
                itemBuilder: (context, index) {
                  return ProdutoTile("list",Produtos.fromDocument(snapshotItens.data.documents[index]));
                }
                ),
           ]
           );
             }
           },
         )
       ),
       )
       ;
  }
}
