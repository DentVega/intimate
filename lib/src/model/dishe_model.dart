import 'package:cloud_firestore/cloud_firestore.dart';

class Dishe {

  String uid;
  String uidEvent;
  String name;
  String image;
  int price;

  Dishe({this.uid, this.uidEvent, this.name, this.image, this.price});

  factory Dishe.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data;
    return Dishe(
      uid: data['uid'],
      uidEvent: data['uidEvent'],
      name: data['name'],
      image: data['image'],
      price: data['price']
    );
  }

  factory Dishe.fromMap(Map data) {
    data = data ?? {};
    return Dishe(
        uid: data['uid'],
        uidEvent: data['uidEvent'],
        name: data['name'],
        image: data['image'],
        price: data['price']
    );
  }

}