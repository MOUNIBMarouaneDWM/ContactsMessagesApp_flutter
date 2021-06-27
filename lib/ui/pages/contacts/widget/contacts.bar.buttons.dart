import 'package:contacts_messages_app/bloc/contacts.actions.dart';
import 'package:contacts_messages_app/bloc/contacts.bloc.dart';
import 'package:contacts_messages_app/ui/pages/contacts/widget/contacts.button.item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class ContactsBarButtons extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween ,
        children: [
            ContactButtonItem(buttonLabel: 'All contacts', contactsEvent: LoadAllContactsEvent(),),
            ContactButtonItem(buttonLabel: 'Student', contactsEvent: LoadStudentsEvent(),),
            ContactButtonItem(buttonLabel: 'Developer', contactsEvent: LoadDeveloperEvent(),),

        ],
      ),
    );
  }
}
