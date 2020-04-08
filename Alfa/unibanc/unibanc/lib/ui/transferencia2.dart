import 'package:flutter/material.dart';
import 'package:unibanc/dao/movimentacao_dao.dart';
import 'package:unibanc/dao/user_dao.dart';
import 'package:unibanc/user/movimentacao.dart';
import 'package:unibanc/user/user.dart';
import 'package:moneytextformfield/moneytextformfield.dart';

import 'home.dart';

class Transferencia2 extends StatelessWidget {
  User userFrom;
  User userTo;
  UserDao _dao = UserDao();
  MovimentacaoDao _movDao = MovimentacaoDao();
  double valorTransf;
  Transferencia2(this.userFrom, this.userTo);
  TextEditingController txtValor = new TextEditingController();
  transferencia(BuildContext context) {
    valorTransf = double.parse(txtValor.text);
    Movimentacao mov = new Movimentacao(userFrom.id, userTo.id, valorTransf);
    userFrom.debito = userFrom.debito - valorTransf;
    userTo.debito = userTo.debito + valorTransf;
    _dao.updatetUser(userFrom);
    _dao.updatetUser(userTo);
    _movDao.insertMov(mov);
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => Home(userFrom)),
        (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(159, 33, 29, 1.0),
        title: Text("Transferencia"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Container(
                height: 35,
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 0.5,
                    ),
                    color: Colors.white30),
                child: Text(
                  "Destinatario: ${userTo.nome} ${userTo.sobrenome}",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 80.0, 20.0, 20.0),
                child: MoneyTextFormField(
                    settings: MoneyTextFormFieldSettings(
                        controller: txtValor,
                        appearanceSettings: AppearanceSettings(
                          labelText: "Valor",
                        ),
                        moneyFormatSettings: MoneyFormatSettings(
                            amount: 0.00, currencySymbol: 'R\$')))),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: RaisedButton(
                color: Color.fromRGBO(159, 33, 29, 1.0),
                padding: EdgeInsets.all(15.0),
                child: Text("Transferir", style: TextStyle(fontSize: 20.0)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                onPressed: () {
                  transferencia(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
