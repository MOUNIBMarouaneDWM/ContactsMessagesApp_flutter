import 'package:contacts_messages_app/bloc/contacts.actions.dart';
import 'package:contacts_messages_app/bloc/contacts.bloc.dart';
import 'package:contacts_messages_app/bloc/contacts.state.dart';
import 'package:contacts_messages_app/enums/enums.dart';
import 'package:contacts_messages_app/ui/pages/contacts/widget/contacts.bar.buttons.dart';
import 'package:contacts_messages_app/ui/pages/contacts/widget/contacts.list.dart';
import 'package:contacts_messages_app/ui/shared/error.retry.action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('contacts')),
      body: Column(
        children: [ContactsBarButtons()
        ,
          Expanded(
            child: BlocBuilder<ContactsBloc, ContactsState>(builder: (context, state) {
              if (state.requestState == RequestState.LOADING) {
               return Center(child: CircularProgressIndicator());
              }
              else if (state.requestState == RequestState.ERROR) {
                return ErrorRetryMessage(errorMessage: state.errorMessage,
                    onAction:(){
                  context.read<ContactsBloc>().add(state.currentEvent);
                    } ,);
              }
              else if(state.requestState==RequestState.LOADED){
                return ContactsList(
                 contacts: state.contacts,
                );
              }
              else{
                return Container();
              }
            }),
          )

        ],
      ),
    );
  }
}
