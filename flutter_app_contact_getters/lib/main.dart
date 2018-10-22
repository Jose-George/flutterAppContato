import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app_contact_getters/Dialogs.dart';
//import 'package:contacts_service/contacts_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(
        primaryColor: Colors.white,
      ),
      title: 'Hospital - App',

      home: Contatos(),
    );
  }
}

class ContatosState extends State<Contatos> {
  Dialogs dialogs = new Dialogs();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      //rodape
      persistentFooterButtons: <Widget>[
        new Text('Obrigado!')
      ],
      appBar: AppBar(
        title: tituloApp(),
      ),
      body: Center(
        child: _getterContacts(),
      ),
    );
  }

  // retorna o botão de doar
  Widget _getterContacts() {

    return new RaisedButton(
      child: setUpButtonChild("Doar agenda"),
      color: Theme.of(context).accentColor,
      splashColor: Colors.blueGrey,
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(40.0)),
      onPressed: () {
        dialogs.confirm(context, "Importante!", "Você deseja doar todos os seus contatos para o telemarketing do hospital da fap? sua identidade será mantida em sigilo.");
      },
    );
  }

  // retornar o nome do botão com a cor branca
  Widget setUpButtonChild(nome) {
    return new Text(
      nome,
      style: const TextStyle(
        color: Colors.white,
      ),
    );
  }

  Widget tituloApp() {
    var assetsImage = new AssetImage('assets/logo.png');
    var imagem = new Image(image: assetsImage, width: 100.0, height: 100.0);
    return new Container(
      child: new Row(
        children: <Widget>[imagem, new Text("Hospital da FAP")
        ],
      ),
    );
  }
}

class Contatos extends StatefulWidget {
  @override
  ContatosState createState() => new ContatosState();
}
