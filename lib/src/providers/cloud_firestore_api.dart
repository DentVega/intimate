import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intimate/src/model/announcement_model.dart';
import 'package:intimate/src/model/devotion_model.dart';
import 'package:intimate/src/model/dishe_model.dart';
import 'package:intimate/src/model/event_model.dart';
import 'package:intimate/src/model/profile_model.dart';
import 'package:intimate/src/model/song_model.dart';

class CloudFirestoreAPI {
  final String PROFILES = 'profiles';
  final String EVENTS = 'events';
  final String ANNOUNCEMENT = 'announcement';
  final String DISHES = 'dishes';
  final String SONGS = 'songs';
  final String DEVOTIONS = 'devotions';

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

  Stream<List<Profile>> streamProfiles() {
    var ref = _db.collection(PROFILES);
    return ref.orderBy('score', descending: true).snapshots().map((list) =>
        list.documents.map((doc) => Profile.fromFirestore(doc)).toList());
  }

  Stream<List<Song>> streamSongs() {
    var ref = _db.collection(SONGS);
    return ref.snapshots().map((list) =>
        list.documents.map((doc) => Song.fromFirestore(doc)).toList());
  }

  Stream<List<Devotion>> streamDevotion() {
    var ref = _db.collection(DEVOTIONS);
    return ref.snapshots().map((list) =>
        list.documents.map((doc) => Devotion.fromFirestore(doc)).toList());
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

//  Stream<List<Song>>

  Stream<List<Dishe>> streamDishes(String idEvent) {
    return _db
        .collection(DISHES)
        .where('uidEvent', isEqualTo: idEvent)
        .snapshots()
        .map((list) =>
            list.documents.map((doc) => Dishe.fromFirestore(doc)).toList());
  }
}
