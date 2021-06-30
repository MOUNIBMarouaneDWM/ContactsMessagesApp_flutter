
import 'package:contacts_messages_app/bloc/messages/messages.actions.dart';
import 'package:contacts_messages_app/bloc/messages/messages.bloc.dart';
import 'package:contacts_messages_app/bloc/messages/messages.widget.dart';
import 'package:contacts_messages_app/model/contact.model.dart';
import 'package:contacts_messages_app/ui/pages/contacts/widget/contact.info.widget.dart';
import 'package:contacts_messages_app/ui/pages/messages/widget/message.form.widget.dart';
import 'package:contacts_messages_app/ui/pages/messages/widget/messages.appbar.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessagePage extends StatelessWidget {
   Contact contact;
  @override
  Widget build(BuildContext context) {
    context.read<MessageBloc>().add(MessagesByContacEvent(this.contact));

    // if(ModalRoute.of(context) != null){
    this.contact = ModalRoute.of(context).settings.arguments as Contact;
    // }

    return Scaffold(
      appBar: MyAppBarWidget(this.contact),
      body: Column(
        children: [
          ContactInfoWidget(contact),
          MessagesWidget(),
          MessagesForm(contact),
        ],
      ),
    );
  }
}
