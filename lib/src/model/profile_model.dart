import 'package:cloud_firestore/cloud_firestore.dart';

class Profile {
  String uid;
  String email;
  String name;
  String nickName;
  int score;
  Timestamp dateBirth;

  Profile({this.uid, this.email, this.name, this.nickName, this.score, this.dateBirth});

  factory Profile.fromMap(Map data) {
    data = data ?? {};
    return Profile(
        uid: data["uid"],
        email: data["email"],
        name: data["name"],
        nickName: data["nickName"],
        score: data["score"],
        dateBirth: data["dateBirth"]
    );
  }

  factory Profile.fromJson(Map<String, dynamic> json) => new Profile(
      uid: json["uid"],
      email: json["email"],
      name: json["name"],
      nickName: json["nickName"],
      score: json["score"],
      dateBirth: json["dateBirth"]
  );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "email": email,
        "name": name,
        "nickName": nickName,
        "score": score,
        "dateBirth": dateBirth
      };
}
