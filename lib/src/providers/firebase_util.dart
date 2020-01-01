import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class BaseFirebaseUtil {

}

class FirebaseUtil extends BaseFirebaseUtil {


  void saveDocumentByCollection(String collection) {
    Firestore.instance.collection(collection).document()
        .setData({

    });
  }

}