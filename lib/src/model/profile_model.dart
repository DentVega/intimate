class Profile {
  String uid;
  String email;
  String name;
  String nickName;
  int score;

  Profile({this.uid, this.email, this.name, this.nickName, this.score});

  factory Profile.fromMap(Map data) {
    data = data ?? {};
    return Profile(
        uid: data["uid"],
        email: data["email"],
        name: data["name"],
        nickName: data["nickName"],
        score: data["score"]);
  }

  factory Profile.fromJson(Map<String, dynamic> json) => new Profile(
      uid: json["uid"],
      email: json["email"],
      name: json["name"],
      nickName: json["nickName"],
      score: json["score"]);

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "email": email,
        "name": name,
        "nickName": nickName,
        "score": score
      };
}
