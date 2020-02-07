import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intimate/src/model/profile_model.dart';
import 'package:intimate/src/pages/ranking_list_page.dart';
import 'package:intimate/src/providers/authentication.dart';
import 'package:intimate/src/providers/cloud_firestore_api.dart';
import 'package:intimate/src/widgets/profile_ranking.dart';
import 'package:provider/provider.dart';

class RankingPage extends StatefulWidget {
  @override
  _RankingPageState createState() => _RankingPageState();
}

class _RankingPageState extends State<RankingPage> {
  final db = CloudFirestoreAPI();

  @override
  Widget build(BuildContext context) {
    Auth auth = Auth();
    final _screenSize = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Container(
          height: _screenSize.height * 0.16,
          child: FutureBuilder(
              future: auth.getCurrentUser(),
              builder: (BuildContext context, AsyncSnapshot<FirebaseUser> snapshot) {
                if (snapshot.hasData) {
                  print(snapshot.data.uid);
                  return StreamProvider<Profile>.value(
                    value: db.streamProfile(snapshot.data.uid),
                    child: ProfileRanking(),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ),
        Container(
          height: _screenSize.height * 0.64,
          child: _listProfiles(),
        )
      ],
    );
  }

  Widget _listProfiles() {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: StreamProvider<List<Profile>>.value(
        value: db.streamProfiles(),
        child: RankingListPage(),
      ),
    );
  }
}
