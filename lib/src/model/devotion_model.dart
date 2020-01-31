import 'package:cloud_firestore/cloud_firestore.dart';

class Devotion {
  String uid;
  String devotion;
  String brother;

  Devotion({this.uid, this.devotion, this.brother});

  factory Devotion.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data;
    return Devotion(
      uid: data['uid'],
      devotion: data['devotion'],
      brother: data['brother'],
    );
  }

}