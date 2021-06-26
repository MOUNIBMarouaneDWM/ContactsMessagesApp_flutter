import 'package:contacts_messages_app/bloc/contacts.bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('contacts')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<ContactsBloc>().add(LoadAllContactsEvent());
                    },
                    child: Text('All contacts'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Students'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Developers'),
                  ),
                ),
              ],
            ),
          ),
          BlocBuilder<ContactsBloc, ContactsState>(builder: (context, state) {
            if (state.requestState == RequestState.LOADING) {
              CircularProgressIndicator();
            } else if (state.requestState == RequestState.ERROR) {
              return Column(
                children: [
                  Text('${state.errorMessage}'),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Retry'),
                  )
                ],
              );
            }
            else if(state.requestState==RequestState.LOADED){}
            else{}
          })
        ],
      ),
    );
  }
}
