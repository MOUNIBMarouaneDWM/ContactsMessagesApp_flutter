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
                    onPressed: () {
                      context.read<ContactsBloc>().add(LoadStudentsEvent());
                    },
                    child: Text('Students'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<ContactsBloc>().add(LoadDeveloperEvent());
                    },
                    child: Text('Developers'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: BlocBuilder<ContactsBloc, ContactsState>(builder: (context, state) {
              if (state.requestState == RequestState.LOADING) {
               return Center(child: CircularProgressIndicator());
              }
              else if (state.requestState == RequestState.ERROR) {
                return Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('${state.errorMessage}'),
                      ElevatedButton(
                        onPressed: () {
                          context.read<ContactsBloc>().add(state.currentEvent);
                        },
                        child: Text('Retry',style: TextStyle(color: Colors.white),),
                      )
                    ],
                  ),
                );
              }
              else if(state.requestState==RequestState.LOADED){
                return Expanded(
                  child: ListView.builder(
                    itemCount: state.contacts.length,
                    itemBuilder:(context,index){
                      return ListTile(
                        title: Row(
                          mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(child:Text('${state.contacts[index].profile}') ,),
                                SizedBox(width: 16,),
                                Text('${state.contacts[index].name}'),
                              ],
                            ),
                            CircleAvatar(child:(
                                Text('${state.contacts[index].score}')
                            ),),
                          ],
                        ),
                      );
                    } ,),
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
