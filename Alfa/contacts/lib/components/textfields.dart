import 'package:flutter/material.dart';

class TexfieldComponent extends StatelessWidget {
  String label;
  TextEditingController controller = new TextEditingController();
  bool obscure;
  TextInputType textInputType;
  TexfieldComponent(
      {@required this.label,
      @required this.controller,
      @required this.obscure,
      @required this.textInputType});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 15),
      child: TextField(
        controller: this.controller,
        obscureText: this.obscure,
        keyboardType: this.textInputType,
        decoration: InputDecoration(
            labelText: this.label,
            labelStyle: TextStyle(color: Colors.black),
            border: OutlineInputBorder(),
            enabledBorder: const OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            )),
      ),
    );
  }
}
