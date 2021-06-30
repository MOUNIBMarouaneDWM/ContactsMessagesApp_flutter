
import 'package:contacts_messages_app/bloc/contacts.actions.dart';
import 'package:contacts_messages_app/bloc/contacts.bloc.dart';
import 'package:contacts_messages_app/bloc/messages/messages.bloc.dart';
import 'package:contacts_messages_app/bloc/messages/messages.state.dart';
import 'package:contacts_messages_app/bloc/messages/messages.widget.dart';
import 'package:contacts_messages_app/ui/pages/contactsWithMessages/widgets/contacts.list.widget.dart';
import 'package:contacts_messages_app/ui/pages/messages/widget/message.form.widget.dart';
import 'package:contacts_messages_app/ui/pages/messages/widget/messages.appbar.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactWithMessages extends StatelessWidget {


  //const ContactWithMessages({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<ContactsBloc>().add(new LoadAllContactsEvent());
    return BlocBuilder<MessageBloc, MessageState>(
      builder: (context,state) => Scaffold(
          appBar: MyAppBarWidget(state.currentContact),
          body: Column(
            children:[ ContactsListHorizontalWidget() ,
              MessagesWidget(),
              MessagesForm(state.currentContact),
            ],
          )
      ),
    );
  }
}
