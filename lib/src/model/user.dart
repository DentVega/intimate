import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String uid;
  String email;
  String name;
  String nickName;
  Timestamp dateBirth;

  User({this.uid, this.email, this.name, this.nickName, this.dateBirth});

  factory User.fromMap(Map data) {
    data = data ?? {};
    return User(
        uid: data["uid"],
        email: data["email"],
        name: data["name"],
        nickName: data["nickName"],
        dateBirth: data["dateBirth"]
    );
  }

  factory User.fromJson(Map<String, dynamic> json) => new User(
      uid: json["uid"],
      email: json["email"],
      name: json["name"],
      nickName: json["nickName"],
      dateBirth: json["dateBirth"]
  );

  Map<String, dynamic> toJson() =>
      {"uid": uid, "email": email, "name": name, "nickName": nickName, "dateBirth": dateBirth};
}
