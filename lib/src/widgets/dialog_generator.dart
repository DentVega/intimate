import 'package:flutter/material.dart';
import 'package:intimate/src/model/song_model.dart';
import 'package:latlong/latlong.dart';
import 'package:intimate/src/model/event_model.dart';
import 'package:intimate/src/widgets/widget_util.dart';

class DialogGenerator {
  static void showDialogVisitEvent(BuildContext context, Event event) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text(event.name),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(event.detail),
                SizedBox(
                  height: 10.0,
                ),
                WidgetUtil.rowDateCenter(context, event),
                SizedBox(
                  height: 10.0,
                ),
                WidgetUtil.rowAddress(context, event),
              ],
            ),
            actions: <Widget>[
              FlatButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('Cerrar'))
            ],
          );
        });
  }

  static void showAlertLoading(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            content: Container(
              width: 55,
              height: 55,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        });
  }

  static void showAlertMessageCustom(BuildContext context, String message) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            content: Container(
              width: 55,
              height: 55,
              child: Center(
                child: Text(
                  message,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            actions: <Widget>[
              FlatButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  })
            ],
          );
        });
  }

  static void completeRegister(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            content: Container(
              width: 55,
              height: 55,
              child: Center(
                child: Text(
                  'Registro Completado',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            actions: <Widget>[
              FlatButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.pop(context);
                  })
            ],
          );
        });
  }

  static void showLetterSong(BuildContext context, Song song) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            content: Container(
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Text(
                        song.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                            letterSpacing: 1.0
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Text(song.song)),
                    ],
                  ),
                ),
              ),
            ),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Cerrar'))
            ],
          );
        });
  }
}
