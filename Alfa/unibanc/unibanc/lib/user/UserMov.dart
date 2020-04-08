import 'dart:async';
import 'app_database.dart';
class UserMov {

String _nomeFrom;
String _nomeTo;
double _valor;
String _date;
int _tipo;

get nomeFrom =>_nomeFrom;
get nomeTo =>_nomeTo;
get valor =>_valor;
get date =>_date;
get tipo =>_tipo;

UserMov.vazio();
UserMov(this._nomeFrom,this._nomeTo,this._valor,this._date,this._tipo);

UserMov.fromMap(Map map) {
 _nomeFrom = map["nomeFrom"];
 _nomeTo =   map["nomeTo"];
 _valor =    map["valor"];
 _date =     map["dataMov"];
 _tipo =     map["tipo"];
}
}