import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lojavirtual/tiles/catagoria_tile.dart';

class ProdutosTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: Firestore.instance.collection("produtos").getDocuments(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          var dividedTiles = ListTile.divideTiles(
              tiles: snapshot.data.documents.map((doc) {
                return CategoriaTile(doc);
              }).toList(),
              color: Colors.grey).toList();
          return ListView(children: dividedTiles);
        }
      },
    );
  }
}
