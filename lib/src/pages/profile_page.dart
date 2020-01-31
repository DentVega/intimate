import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intimate/src/model/profile_model.dart';
import 'package:intimate/src/providers/authentication.dart';
import 'package:intimate/src/providers/cloud_firestore_api.dart';
import 'package:intimate/src/widgets/profile_widget.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  final db = CloudFirestoreAPI();

  @override
  Widget build(BuildContext context) {
    Auth auth = Auth();
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
      ),
      body: Center(child: Container(
        child: FutureBuilder(
            future: auth.getCurrentUser(),
            builder: (BuildContext context, AsyncSnapshot<FirebaseUser> snapshot) {
              if (snapshot.hasData) {
                print(snapshot.data.uid);
                return StreamProvider<Profile>.value(
                  value: db.streamProfile(snapshot.data.uid),
                  child: ProfileWidget(),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      )),
    );
  }
}
