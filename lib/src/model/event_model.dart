import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
  String uid;
  String name;
  String banner;
  String detail;
  String address;
  GeoPoint location;
  String typeEvent;
  Timestamp date;
  bool deleteFlag;

  Event(
      {this.uid,
      this.name,
      this.banner,
      this.detail,
      this.address,
      this.location,
      this.typeEvent,
      this.date,
      this.deleteFlag});

  factory Event.fromMap(Map data) {
    data = data ?? {};
    return Event(
      uid: data['uid'],
      name: data['name'],
      banner: data['banner'],
      detail: data['detail'],
      address: data['address'],
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
      address: data['address'],
      location: data['location'],
      typeEvent: data['typeEvent'],
      date: data['date'],
      deleteFlag: data['deleteFlag'],
    );
  }
}
