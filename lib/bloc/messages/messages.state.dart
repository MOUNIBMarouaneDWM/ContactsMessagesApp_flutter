import 'dart:html';
import 'package:contacts_messages_app/enums/enums.dart';
import 'package:contacts_messages_app/model/contact.model.dart';
import 'package:contacts_messages_app/model/message.model.dart';

class MessageState{

  List<Message> messages;
  RequestState requestState;
  dynamic errorMessage;
  dynamic currentMsgEvent;
  List<MessageState> selectedMessages=[];
  Contact currentContact;

  MessageState({
    this.messages,
    this.requestState,
    this.errorMessage,
    this.currentMsgEvent,
    this.selectedMessages,
    this.currentContact
  });

  MessageState.initialeState() : requestState = RequestState.NONE,
        messages = [], errorMessage = '', selectedMessages=[]  ,
        currentMsgEvent = null , currentContact= new Contact() ;
}