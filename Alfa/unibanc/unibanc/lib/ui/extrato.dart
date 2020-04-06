import 'package:flutter/material.dart';
import 'package:unibanc/user/UserMov.dart'; 
import 'package:unibanc/user/user.dart';

class Extrato extends StatelessWidget {
  User user;
  Extrato(this.user);
  UserMov mov = new UserMov.vazio(); 
  List<UserMov> movs = List();
  
  getmovimento() async {
     movs= await mov.selectMov2(user.id);
     movs.length;
  }
  
  @override
  Widget build(BuildContext context) {
    
    getmovimento();
    
    
    
    
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(159, 33, 29, 1.0),
        title: Text("Extrato"),
        centerTitle: true,

      ),
      body: FutureBuilder(
        initialData: List(),
        future: Future.delayed(Duration(seconds: 2)).then((value)=> mov.selectMov2(user.id)),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            
            case ConnectionState.none:
              // TODO: Handle this case.
              break;
            case ConnectionState.waiting:
               return Center(
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.center,
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: <Widget>[
                     CircularProgressIndicator(),
                     Text("Carregando")
                   ],
                 ),
               );              
              break;
            case ConnectionState.active:
              // TODO: Handle this case.
              break;
            case ConnectionState.done:
              List<UserMov> movimento = snapshot.data ;
              //print("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH ${snapshot.data}");

              return ListView.builder(
                itemCount: movimento.length,
                itemBuilder: (context,indice){
                  UserMov usermov = movimento[indice];
                  
                  return Card(                        
            child: criaCard(usermov)
          );
                },
              );
              break;
          }
        })
    );
  }
  criaCard(UserMov userm) {
    if (userm.tipo ==0) {
      return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(userm.nomeFrom),
                Icon(Icons.arrow_forward, color: Colors.red,),
                Text(userm.nomeTo),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(userm.valor.toString()),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(userm.date),
                ),
              ],
            );
    } else {
      return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(userm.nomeTo),
                Icon(Icons.arrow_back, color: Colors.green,),
                Text(userm.nomeFrom),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(userm.valor.toString()),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(userm.date),
                ),
              ],
            );
            }
  }
}
