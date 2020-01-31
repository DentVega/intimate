import 'package:flutter/material.dart';
import 'package:intimate/src/model/profile_model.dart';
import 'package:intimate/src/providers/cloud_firestore_repository.dart';

class ProfileProvider with ChangeNotifier {
  Profile _profile;
  bool _loading = false;
  final _cloudFirestoreRepository = CloudFirestoreRepository();

  get profile {
    return _profile;
  }

  get loading {
    return _loading;
  }

  set profile(Profile profile) {
    this._profile = profile;
    this._loading = false;
    notifyListeners();
  }

//  void uploadProfile(Profile profile) =>
//      _cloudFirestoreRepository.uploadUserDataFirestore(profile);
}
