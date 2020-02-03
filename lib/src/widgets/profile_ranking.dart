import 'package:flutter/material.dart';
import 'package:intimate/src/model/profile_model.dart';
import 'package:provider/provider.dart';

class ProfileRanking extends StatefulWidget {
  @override
  _ProfileRankingState createState() => _ProfileRankingState();
}

class _ProfileRankingState extends State<ProfileRanking> {
  @override
  Widget build(BuildContext context) {
    var profile = Provider.of<Profile>(context);
    print(profile.toString());
    return Container(
      child: Column(
        children: <Widget>[
          profile != null ? _profileUser(profile) : Container(),
        ],
      ),
    );
  }

  Widget _profileUser(Profile profile) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(5.0),
        width: double.infinity,
        child: Card(
          elevation: 5.0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0)),
          child: Container(
            padding: EdgeInsets.all(15.0),
            child: Column(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://d500.epimg.net/cincodias/imagenes/2016/07/04/lifestyle/1467646262_522853_1467646344_noticia_normal.jpg'),
                  radius: 30.0,
                ),
                SizedBox(
                  height: 15.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(profile.nickName),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      '${profile.score} puntos',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
