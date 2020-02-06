import 'package:flutter/material.dart';
import 'package:intimate/src/model/song_model.dart';
import 'package:intimate/src/providers/cloud_firestore_api.dart';
import 'package:intimate/src/widgets/dialog_generator.dart';
import 'package:url_launcher/url_launcher.dart';

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
        child: StreamBuilder(
          stream: db.streamSongs(),
          builder: (BuildContext context, AsyncSnapshot<List<Song>> snapshot) {
            return _createList(snapshot.data, context);
          },
        ),
      ),
    );
  }

  Widget _createList(List<Song> songs, BuildContext context) {
    if (songs != null) {
      return ListView(
        children: songs.map((song) {
          return Card(
            elevation: 5.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Nombre: ${song.name}', style: TextStyle(fontWeight: FontWeight.bold),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      FlatButton(onPressed: (){
                        _launchURL(song.url);
                      }, child: Text('Ver Cancion')),
                      SizedBox(width: 10,),
                      FlatButton(onPressed: (){
                        DialogGenerator.showLetterSong(context, song);
                      }, child: Text('Ver Letra')),
                    ],
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      );
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }

  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

}
