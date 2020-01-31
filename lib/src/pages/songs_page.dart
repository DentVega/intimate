import 'package:flutter/material.dart';
import 'package:intimate/src/model/song_model.dart';
import 'package:intimate/src/pages/songs_list.dart';
import 'package:intimate/src/providers/cloud_firestore_api.dart';
import 'package:provider/provider.dart';

class SongsPage extends StatelessWidget {
  final db = CloudFirestoreAPI();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Canciones'),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: StreamProvider<List<Song>>.value(
          value: db.streamSongs(),
          child: SongsList(),
        ),
      )
    );
  }
}
