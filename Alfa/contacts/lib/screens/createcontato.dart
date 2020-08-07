import 'package:contacts/Dao/Daofirebase.dart';
import 'package:contacts/components/textfields.dart';
import 'package:contacts/model/contatoModel.dart';
import 'package:contacts/model/userModel.dart';
import 'package:contacts/screens/lista_contatos.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Createcontato extends StatefulWidget {
  ContatoModel contatoModel = ContatoModel.vazio();
  UserModel userModel;
  Createcontato({this.contatoModel, @required this.userModel});
  @override
  _CreatecontatoState createState() => _CreatecontatoState(
      userModel: this.userModel, contatoModel: this.contatoModel);
}

class _CreatecontatoState extends State<Createcontato> {
  ContatoModel contatoModel = ContatoModel.vazio();
  UserModel userModel;
  _CreatecontatoState({this.contatoModel, @required this.userModel});
  TextEditingController txtnome = TextEditingController();
  TextEditingController txtsobrenome = TextEditingController();
  TextEditingController txtemail = TextEditingController();
  TextEditingController txttelefone = TextEditingController();
  String appbarTitle = "Novo contato";
  String image = "assets/personpng.png";
  FirebaseDao firebaseDao = FirebaseDao.vazio();
  final _formKey = GlobalKey<FormState>();

  _inicializetxt() {
    //print("here");
    if (this.contatoModel != null) {
      setState(() {
        txtnome.text = contatoModel.nome;
        txtsobrenome.text = contatoModel.sobrenome;
        txtemail.text = contatoModel.email;
        txttelefone.text = contatoModel.telefone;
        appbarTitle = "${contatoModel.nome} ${contatoModel.sobrenome}";
        contatoModel.url == "" || contatoModel.url == null
            ? image = image
            : image = contatoModel.url;
      });
    }
  }

  _updatetext() async {
    if (this.contatoModel != null) {
      contatoModel.nome = txtnome.text;
      contatoModel.sobrenome = txtsobrenome.text;
      contatoModel.email = txtemail.text;
      contatoModel.telefone = txttelefone.text;

      if (contatoModel.url != image || image != "assets/personpng.png") {
        List<String> dados = await firebaseDao.sendImage(
            image, contatoModel.contatoid, contatoModel.picture);
        contatoModel.picture = dados[0];
        contatoModel.url = dados[1];
      }
      firebaseDao.updateFirebase(
          userModel.userid, contatoModel.contatoid, contatoModel);
      setState(() {
        image = "assets/personpng.png";
      });
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => ListaContatos(userModel)),
          (Route<dynamic> route) => false);
    } else {
      ContatoModel contatoModel = ContatoModel.nomeall(txtnome.text,
          txtsobrenome.text, txttelefone.text, txtemail.text, "", "", "", "");
      FirebaseDao firebaseDao = FirebaseDao.vazio();
      print("criando usuario ${userModel.userid}");
      firebaseDao.criarContato(contatoModel, userModel.userid);
      setState(() {
        image = "assets/personpng.png";
      });
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => ListaContatos(userModel)),
          (Route<dynamic> route) => false);
    }
  }

  _pickCamera() async {
    final pickedFile = await ImagePicker().getImage(source: ImageSource.camera);
    setState(() {
      image = pickedFile.path;
    });
  }

  ImageSelector() {
    if (contatoModel == null) {
      return Container(
        width: 120.0,
        height: 120.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey,
          image: DecorationImage(image: AssetImage(image)),
        ),
      );
    } else {
      if (contatoModel.url == "") {
        return Container(
          width: 120.0,
          height: 120.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey,
            image: DecorationImage(image: AssetImage(image)),
          ),
        );
      }
    }
    return Container(
      width: 120.0,
      height: 120.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey,
      ),
      child: Image.network(contatoModel.url),
    );
  }

  @override
  void initState() {
    super.initState();
    _inicializetxt();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text(appbarTitle),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.location_on), onPressed: () {})
          ],
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Center(
                  child: ImageSelector(),
                ),
                GestureDetector(
                  child: Text(
                    "Adicionar foto",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.red),
                  ),
                  onTap: () async {
                    _pickCamera();
                  },
                ),
                Padding(padding: EdgeInsets.only(top: 8.0)),
                TexfieldComponent(
                  label: "Nome",
                  controller: txtnome,
                  obscure: false,
                  textInputType: TextInputType.text,
                ),
                TexfieldComponent(
                  label: "Sobrenome",
                  controller: txtsobrenome,
                  obscure: false,
                  textInputType: TextInputType.text,
                ),
                TexfieldComponent(
                  label: "telefone",
                  controller: txttelefone,
                  obscure: false,
                  textInputType: TextInputType.phone,
                ),
                TexfieldComponent(
                  label: "email",
                  controller: txtemail,
                  obscure: false,
                  textInputType: TextInputType.emailAddress,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: RaisedButton(
                    color: Colors.red,
                    padding: EdgeInsets.only(
                        top: 15.0, bottom: 15.0, left: 90.0, right: 90.0),
                    child: Text("Salvar",
                        style: TextStyle(fontSize: 20.0, color: Colors.white)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    onPressed: () async {
                      _updatetext();
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
