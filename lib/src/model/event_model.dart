import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intimate/src/model/tipe_event.dart';

class Event {
  String uid;
  String name;
  String banner;
  String detail;
  String typeEvent;
  Timestamp date;
  bool deleteFlag;

  Event({this.uid, this.name, this.banner, this.detail, this.typeEvent, this.date, this.deleteFlag});

  factory Event.fromMap(Map data) {
    data = data ?? {};
    return Event(
      uid: data['uid'],
      name: data['name'],
      banner: data['banner'],
      detail: data['detail'],
      typeEvent: data['typeEvent'],
      date: data['date'],
      deleteFlag: data['deleteFlag'],
    );
  }

  factory Event.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data;
    return Event(
      uid: data['uid'],
      name: data['name'],
      banner: data['banner'],
      detail: data['detail'],
      typeEvent: data['typeEvent'],
      date: data['date'],
      deleteFlag: data['deleteFlag'],
    );
  }

}