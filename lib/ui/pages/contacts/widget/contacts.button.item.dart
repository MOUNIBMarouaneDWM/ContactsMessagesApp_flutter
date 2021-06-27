import 'package:contacts_messages_app/bloc/contacts.actions.dart';
import 'package:contacts_messages_app/bloc/contacts.bloc.dart';
import 'package:contacts_messages_app/bloc/contacts.state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactButtonItem extends StatelessWidget {
  String buttonLabel;
  ContactsEvent contactsEvent;

  ContactButtonItem({this.buttonLabel, this.contactsEvent});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactsBloc,ContactsState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.fromLTRB(4, 4,4, 4),
          decoration:
              BoxDecoration(
                  border: Border.all(
                  width: (state.currentEvent.runtimeType==contactsEvent.runtimeType)?3:0,
                   color: Colors.red)),
          child: ElevatedButton(
            onPressed: () {
              context.read<ContactsBloc>().add(contactsEvent);
            },
            child: Text('$buttonLabel'),
          ),
        );
      },
    );
  }
}
