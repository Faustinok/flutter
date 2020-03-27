import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const request = "https://api.hgbrasil.com/finance";
void main() async {
  runApp(
    MaterialApp(
      title: "teste",
      home: Home(),
  theme: ThemeData(
      hintColor: Colors.amber,
      primaryColor: Colors.white,
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.amber)),
        hintStyle: TextStyle(color: Colors.amber),
      )),
));
      
}

Future<Map> getMoney() async {
  http.Response response = await http.get(request);
  return json.decode(response.body);
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double dollar;
  double euro;
  double real;
  final TextEditingController txtDollar = new TextEditingController();
  final TextEditingController txtReal = new TextEditingController();
  final TextEditingController txtEuro = new TextEditingController();

  void _changeReal (String text) {
    if (txtReal.text.isEmpty) {
      txtDollar.text ="";
      txtEuro.text ="";
    }
    real = double.parse(text);  
    txtDollar.text = (real/dollar).toStringAsFixed(2);
    txtEuro.text = (real/euro).toStringAsFixed(2);
  }
  void _changeDollar (String text) {
    if (txtDollar.text.isEmpty) {
      txtReal.text ="";
      txtEuro.text ="";
    }
    double dollar = double.parse(text);
    txtReal.text = (dollar * this.dollar).toStringAsFixed(2);
    txtEuro.text = ((dollar * this.dollar)/euro).toStringAsFixed(2);
  }
  void _changeEuro (String text) {
    if (txtEuro.text.isEmpty) {
      txtReal.text ="";
      txtDollar.text ="";
    }    
    double euro = double.parse(text);
    txtReal.text = (euro * this.euro).toStringAsFixed(2);
    txtDollar.text = ((euro * this.euro)/dollar).toStringAsFixed(2);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Text(
            "\$ Conversor \$",
          ),
          centerTitle: true,
        ),
        body: FutureBuilder<Map>(
            future: getMoney(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return Center(
                    child: Text(
                      "Carregando dados...",
                      style: TextStyle(
                        color: Colors.amber,
                        fontSize: 25.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  );
                default:
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        "Carregando dados...",
                        style: TextStyle(
                          color: Colors.amber,
                          fontSize: 25.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    );
                  }
                  dollar = snapshot.data["results"]["currencies"]["USD"]["buy"];
                  euro = snapshot.data["results"]["currencies"]["EUR"]["buy"];

                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SingleChildScrollView(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Icon(Icons.monetization_on,
                            size: 150.0,
                            color: Colors.amber),
                        buildTextfield("Real","R\$",txtReal,_changeReal),
                        Divider(), 
                        buildTextfield("Dollar","US\$",txtDollar,_changeDollar),
                        Divider(),
                        buildTextfield("Euro","£",txtEuro,_changeEuro),
                      ],
                    )),
                  );
              }
            }));
  }
}
Widget buildTextfield (String label, String prefix,TextEditingController ctrl , Function fnct  ) {
  return TextField(
                          controller: ctrl,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            prefixText: prefix,
                            labelText: label,
                            labelStyle: TextStyle(color: Colors.amber),
                            border: OutlineInputBorder(),                            
                          ),
                          onChanged: fnct,
                          style: TextStyle(color: Colors.amber,fontSize: 25.0),
                          //keyboardType: TextInputType.number,
                        );
}