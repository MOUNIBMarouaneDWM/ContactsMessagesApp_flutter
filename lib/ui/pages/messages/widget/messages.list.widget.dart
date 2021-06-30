
import 'package:contacts_messages_app/model/message.model.dart';
import 'package:contacts_messages_app/ui/pages/messages/widget/message.item.widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessagesList extends StatelessWidget {
  List<Message> messages;
  ScrollController scrollController = new ScrollController();
  MessagesList(this.messages);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if(scrollController.hasClients){
        scrollController.jumpTo(scrollController.position.maxScrollExtent);
      }
    });
    return ListView.separated(
        itemBuilder: (context, index) => MessageItem(messages[index]),
        separatorBuilder: (context, index) => Divider(color: Colors.grey,),
        itemCount: messages.length
    );
  }
}
