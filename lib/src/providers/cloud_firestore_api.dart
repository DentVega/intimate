import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intimate/src/model/announcement_model.dart';
import 'package:intimate/src/model/dishe_model.dart';
import 'package:intimate/src/model/event_model.dart';
import 'package:intimate/src/model/profile_model.dart';

class CloudFirestoreAPI {
  final String PROFILES = 'profiles';
  final String EVENTS = 'events';
  final String ANNOUNCEMENT = 'announcement';
  final String DISHES = 'dishes';

  final Firestore _db = Firestore.instance;

  Future<void> uploadProfile(Profile profile) {
    DocumentReference ref = _db.collection(PROFILES).document(profile.uid);
    return ref.setData({
      'uid': profile.uid,
      'email': profile.email,
      'name': profile.name,
      'nickName': profile.nickName,
      'score': profile.score,
      'dateBirth': profile.dateBirth
    }, merge: true);
  }

  Stream<Profile> streamProfile(String uid) {
    return _db
        .collection(PROFILES)
        .document(uid)
        .snapshots()
        .map((snap) => Profile.fromMap(snap.data));
  }

  Stream<List<Event>> streamEvents() {
    var ref = _db.collection(EVENTS);
    return ref.snapshots().map((list) =>
        list.documents.map((doc) => Event.fromFirestore(doc)).toList());
  }

  Stream<List<Announcement>> streamAnnouncement() {
    var ref = _db.collection(ANNOUNCEMENT);
    return ref.snapshots().map((list) =>
        list.documents.map((doc) => Announcement.fromFirestore(doc)).toList());
  }

  Stream<List<Dishe>> streamDishes(String idEvent) {
    return _db
        .collection(DISHES)
        .where('uidEvent', isEqualTo: idEvent)
        .snapshots()
        .map((list) =>
            list.documents.map((doc) => Dishe.fromFirestore(doc)).toList());
  }
}
