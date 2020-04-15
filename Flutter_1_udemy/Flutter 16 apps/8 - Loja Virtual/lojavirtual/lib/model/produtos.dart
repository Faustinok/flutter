import 'package:cloud_firestore/cloud_firestore.dart';

class Produtos {
String id;
String title;
String descricao;
String preco;
List images;
List cores; 

Produtos.fromDocument(DocumentSnapshot snapshot) {
  id =  snapshot.documentID;
  title = snapshot.data["title"];
  descricao = snapshot.data["descricao"];
  preco = snapshot.data["preco"] + 0.0;
  images= snapshot.data["images"];
  cores = snapshot.data["cores"];
}


}
