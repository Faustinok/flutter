import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Calculadora Imc",
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController txfPeso = TextEditingController();
  TextEditingController txfAltura = TextEditingController();
  String msg = "Informe os dados";
  String message;
  double imc;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  void _limpaCampos() {
    setState(() {
      txfPeso.text = "";
      txfAltura.text = "";
      msg = "Informe os dados";
      _formKey = GlobalKey<FormState>();
    });
  }

  void _calculaImc() {
    double _peso = double.parse(txfPeso.text);
    double _altura = double.parse(txfAltura.text) / 100;
    imc = _peso / ((_altura * _altura));
    print("imc: $imc");
    print("imc: $imc");
    print("imc: $imc");
    print("imc: $imc");
    print("imc: $imc");
    print("imc: $imc");
    print("imc: $imc");
    print("imc: $imc");

    setState(() {
      if (imc < 18.6) {
        msg = "Abaixo do peso (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 18.6 && imc < 24.9) {
        msg = "Peso ideal (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 24.9 && imc < 29.9) {
        msg = "Levemente acima do Peso (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 29.9 && imc < 34.9) {
        msg = "Obesidade Grau I (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 34.9 && imc < 39.9) {
        msg = "Obesidade Grau II (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 40) {
        msg = "Obesidade Grau III (${imc.toStringAsPrecision(3)})";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora Imc"),
        backgroundColor: Colors.green,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.refresh), onPressed: _limpaCampos)
        ],
      ),
      body: SingleChildScrollView(
          child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Icon(
              Icons.person_outline,
              size: 120,
              color: Colors.green,
            ),
            TextFormField(
              controller: txfPeso,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Peso (kg)",
                  labelStyle: TextStyle(color: Colors.green)),
              validator: (value) {
                if (value.isEmpty) return "Informe o Peso";
              },
            ),
            TextFormField(
              controller: txfAltura,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Altura (cm)",
                  labelStyle: TextStyle(color: Colors.green)),
              validator: (value) {
                if (value.isEmpty) {
                  return "Insira a Altura";
                }
              },
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Container(
                height: 50.0,
                child: RaisedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate())
                    {
                     _calculaImc();
                    }
                  },
                  color: Colors.green,
                  child: Text(
                    "Calcular",
                    style: TextStyle(fontSize: 25.0, color: Colors.white),
                  ),
                ),
              ),
            ),
            Text(
              msg,
              style: TextStyle(fontSize: 25.0, color: Colors.green),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      )),
    );
  }
}
