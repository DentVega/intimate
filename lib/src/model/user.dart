class User {
  String uid;
  String email;
  String name;
  String nickName;

  User({this.uid, this.email, this.name, this.nickName});

  factory User.fromMap(Map data) {
    data = data ?? {};
    return User(
        uid: data["uid"],
        email: data["email"],
        name: data["name"],
        nickName: data["nickName"]);
  }

  factory User.fromJson(Map<String, dynamic> json) => new User(
      uid: json["uid"],
      email: json["email"],
      name: json["name"],
      nickName: json["nickName"]);

  Map<String, dynamic> toJson() =>
      {"uid": uid, "email": email, "name": name, "nickName": nickName};
}
