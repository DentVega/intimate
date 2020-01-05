import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
  String uid;
  String name;
  String banner;
  String detail;
  GeoPoint location;
  String typeEvent;
  Timestamp date;
  bool deleteFlag;

  Event({this.uid, this.name, this.banner, this.detail, this.location, this.typeEvent, this.date, this.deleteFlag});

  factory Event.fromMap(Map data) {
    data = data ?? {};
    return Event(
      uid: data['uid'],
      name: data['name'],
      banner: data['banner'],
      detail: data['detail'],
      location: data['location'],
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
      location: data['location'],
      typeEvent: data['typeEvent'],
      date: data['date'],
      deleteFlag: data['deleteFlag'],
    );
  }

}