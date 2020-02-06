import 'package:cloud_firestore/cloud_firestore.dart';

class Song {
  String uid;
  String name;
  String song;
  String url;

  Song({this.uid, this.name, this.song, this.url});

  factory Song.fromMap(Map data) {
    data = data ?? {};
    return Song(
      uid: data["uid"],
      name: data["name"],
      song: data["song"],
      url: data["url"],
    );
  }

  factory Song.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data;
    return Song(
      uid: data['uid'],
      name: data['name'],
      song: data['song'],
      url: data['url'],
    );
  }

}