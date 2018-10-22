import 'package:flutter/material.dart';

import 'package:contacts_service/contacts_service.dart';
import 'package:http/http.dart' as http;

class Contato{

  Iterable<Contact> _contacts;

  @override
  initState() {
    listContacts();
  }

  addData(name, numero){
    var url = "http://10.10.3.4/my_store/addcontato.php";
    http.post(url, body: {"name": name, "numero": numero})
        .then((response) {
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");
    });
  }


  listContacts() async {

    var contacts = await ContactsService.getContacts();
    _contacts = contacts;

    if(contacts != null){
      for(int i=0; i<contacts.length; i++){
        Contact c = _contacts?.elementAt(i);
        DetailsContact det = new DetailsContact(c.phones);
        String nomeContato = c.displayName ?? "";
        addData(nomeContato, det.getConts().toString());
      }
    }
  }
}

class DetailsContact{

  final Iterable<Item> _items;
  DetailsContact(this._items);

   getConts(){
   return _items.map((i)=> i.value);
  }

}
