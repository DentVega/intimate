import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intimate/src/model/announcement_model.dart';
import 'package:intimate/src/model/event_model.dart';
import 'package:intimate/src/model/profile_model.dart';

class CloudFirestoreAPI {
  final String PROFILES = 'profiles';
  final String EVENTS = 'events';
  final String ANNOUNCEMENT = 'announcement';

  final Firestore _db = Firestore.instance;

  void uploadProfile(Profile profile) async {
    DocumentReference ref = _db.collection(PROFILES).document();
    profile.uid = ref.documentID;
    return ref.setData({
      'uid': profile.uid,
      'email': profile.email,
      'name': profile.name,
      'nickName': profile.nickName,
      'score': profile.score
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
}
