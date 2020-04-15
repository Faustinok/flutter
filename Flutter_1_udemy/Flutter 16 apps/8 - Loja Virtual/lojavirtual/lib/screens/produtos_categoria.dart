import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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
             Container(color: Colors.blue,),
             Container(color: Colors.yellow),
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
