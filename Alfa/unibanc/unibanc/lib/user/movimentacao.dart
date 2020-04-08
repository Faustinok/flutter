import 'app_database.dart';

class Movimentacao {
  int _idFrom;
  int _idTo;
  double _valor;
  Movimentacao(this._idFrom,this._idTo,this._valor);
 int get idFrom => _idFrom;
 int get idTo => _idTo;
 double get valor => _valor;

 Map toMap() {
   Map<String,dynamic> map = {
     "id_from": idFrom,
     "id_to": idTo,
     "valor":valor
   }; 
   return map;
 }  
}