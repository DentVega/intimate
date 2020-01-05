import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong/latlong.dart';
import 'package:intimate/src/model/event_model.dart';
import 'package:intimate/src/utils/date_format_util.dart';

class WidgetUtil {
  static void showAlert(BuildContext context, String title, String message) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(message),
                FlutterLogo(
                  size: 100,
                )
              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  static Widget rowDateCenter(BuildContext context, Event event) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: 10.0,
        ),
        Text('Fecha:'),
        SizedBox(
          width: 5.0,
        ),
        Text(
          DateFormatUtil.formatDateYYYYMMDD(event.date.toDate()),
          style: TextStyle(fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  static Widget rowDate(BuildContext context, Event event) {
    return Row(
      children: <Widget>[
        SizedBox(
          height: 10.0,
        ),
        Text('Fecha:'),
        SizedBox(
          width: 5.0,
        ),
        Text(
          DateFormatUtil.formatDateYYYYMMDD(event.date.toDate()),
          style: TextStyle(fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  static Widget rowAddress(BuildContext context, Event event) {
    return Container(
      width: 300.0,
      child: Row(
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          Text('Direccion:'),
          SizedBox(
            width: 5.0,
          ),
          Container(
            width: 200.0,
            child: Text(event.address,
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
                style: TextStyle(fontWeight: FontWeight.bold)),
          )
        ],
      ),
    );
  }

  static Widget location(BuildContext context, LatLng latLng, double height) {
    return Container(
      height: height,
      child: FlutterMap(
        options: new MapOptions(center: latLng),
        layers: [
          createMap('streets'),
          createMarket(latLng)
        ],
      ),
    );
  }

  static createMap(String typeMap) {
    return TileLayerOptions(
        urlTemplate: 'https://api.mapbox.com/v4/'
            '{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}',
        additionalOptions: {
          'accessToken':
          '',
          'id': 'mapbox.$typeMap'
          // streets, dark, light, outdoors, satellite
        });
  }

  static createMarket(LatLng positionEvent) {
    return MarkerLayerOptions(markers: <Marker>[
      Marker(
          width: 100.0,
          height: 100.0,
          point: positionEvent,
          builder: (context) => Container(
            child: Icon(
              Icons.location_on,
              size: 45.0,
              color: Theme.of(context).primaryColor,
            ),
          ))
    ]);
  }

}
