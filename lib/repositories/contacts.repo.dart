import 'dart:math';

import 'package:contacts_messages_app/model/contact.model.dart';

class ContactsRepository{
Map<int,Contact> contacts={
  1:Contact(id: 1,name: 'MOUNIB1',profile: 'MO1',Type: 'developer',score: 3340),
  2:Contact(id: 2,name: 'MOUNIB2',profile: 'MO2',Type: 'developer',score: 1230),
  3:Contact(id: 3,name: 'MOUNIB3',profile: 'MO3',Type: 'developer',score: 1230),
  4:Contact(id: 4,name: 'MOUNIB4',profile: 'MO4',Type: 'student',score: 330),
  5:Contact(id: 5,name: 'MOUNIB5',profile: 'MO5',Type: 'student',score: 3430),
  6:Contact(id: 6,name: 'MOUNIB6',profile: 'MO6',Type: 'student',score: 348),
};
Future<List<Contact>> allContacts() async{
  await Future.delayed(Duration(seconds: 1));
  int rmd = Random().nextInt(10);
  if(rmd>3){
    return contacts.values.toList();
  }
  else{
    throw Exception('Internet error');
  }
}
Future<List<Contact>> contactByType(String type) async{
  await Future.delayed(Duration(seconds: 1));
  int rmd = Random().nextInt(10);
  if(rmd>0){
    return contacts.values.toList().where((element) => element.Type==type).toList();
  }
  else{
    throw Exception('Internet error');
  }
}
}