import 'package:flutter/material.dart';
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
                SizedBox(height: 10.0,),
                WidgetUtil.rowDateCenter(context, event),
                SizedBox(height: 10.0,),
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
}