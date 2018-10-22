import 'package:flutter/material.dart';
import 'package:flutter_app_contact_getters/Contato.dart';
//import 'package:contacts_service/contacts_service.dart';

class Dialogs{


  Contato c = new Contato();

  _confirmResult(bool isYes, BuildContext context){
    if(isYes){
      print("Usuário escolheu SIM");
      c.listContacts();
      Navigator.pop(context);
    }else{
      print("Usuário escolheu NÃO");
      Navigator.pop(context);
    }
  }

  confirm(BuildContext context, String title, String description){
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(description)
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: () => _confirmResult(false, context),
              child: Text('Cancelar'),
            ),
            FlatButton(
              onPressed: () => _confirmResult(true, context),
              child: Text('Sim'),
            ),
          ],
        );
      }
    );
  }

}