class Message {

  int id;
  int contactId;
  DateTime dateTime;
  String content;
  String type;
  bool selected=false;

  Message({  this.id, this.contactId, this.dateTime,  this.content, this.type, this.selected});
}