import 'package:cloud_firestore/cloud_firestore.dart';

class Church {
  String uid;
  String name;
  String photo;
  GeoPoint location;

  Church({this.uid, this.name, this.photo, this.location});

  factory Church.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data;
    return Church(
      uid: data['uid'],
      name: data['name'],
      photo: data['photo'],
      location: data['location']
    );
  }

}