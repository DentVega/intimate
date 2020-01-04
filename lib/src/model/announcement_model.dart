import 'package:cloud_firestore/cloud_firestore.dart';

class Announcement {

  String uid;
  String name;
  String detail;
  bool deleteFlag;

  Announcement({this.uid, this.name, this.detail, this.deleteFlag});

  factory Announcement.fromMap(Map data) {
    data = data ?? {};
    return Announcement(
      uid: data['uid'],
      name: data['name'],
      detail: data['detail'],
      deleteFlag: data['deleteFlag'],
    );
  }

  factory Announcement.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data;
    return Announcement(
      uid: data['uid'],
      name: data['name'],
      detail: data['detail'],
      deleteFlag: data['deleteFlag'],
    );
  }

}