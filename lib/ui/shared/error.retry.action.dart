import 'package:contacts_messages_app/model/contact.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class ErrorRetryMessage extends StatelessWidget {

String errorMessage;
Function onAction ;

ErrorRetryMessage({this.errorMessage, this.onAction});

@override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('${errorMessage}'),
          ElevatedButton(
            onPressed: onAction,
            child: Text('Retry',style: TextStyle(color: Colors.white),),
          )
        ],
      ),
    );;
  }

}
