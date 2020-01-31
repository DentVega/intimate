import 'package:flutter/material.dart';
import 'package:intimate/src/model/song_model.dart';
import 'package:provider/provider.dart';

class SongsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var songs = Provider.of<List<Song>>(context);
    final _screenSize = MediaQuery.of(context).size;
    return Container(
      child: SizedBox(
        height: _screenSize.height,
        child: _crearList(songs, context),
      ),
    );
  }

  Widget _crearList(List<Song> songs, BuildContext context) {
    if (songs != null) {
      return ListView(
        children: songs.map((song) {
          return Card(
            elevation: 5.0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
            child: Container(
              padding: EdgeInsets.all(20.0),
              child: Row(
                children: <Widget>[
                  Text('Nombre: ${song.song}')
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

}
