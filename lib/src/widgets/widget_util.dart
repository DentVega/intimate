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
      width: 350.0,
      child: Column(
        children: <Widget>[
          Text(
            'Dirección:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            event.address,
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
        ],
      ),
    );
  }

  static Widget location(BuildContext context, LatLng latLng, double height) {
    return Container(
      height: height,
      child: FlutterMap(
        options: new MapOptions(center: latLng),
        layers: [createMap('streets'), createMarket(latLng)],
      ),
    );
  }

  static createMap(String typeMap) {
    return TileLayerOptions(
        urlTemplate: 'https://api.mapbox.com/v4/'
            '{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}',
        additionalOptions: {
          'accessToken':
              'pk.eyJ1IjoiYnJpYW52aCIsImEiOiJjazR3NXc2bTkxMWI5M21ub3h2OXVmMWE3In0.iWf0dloLi5eblx6h0npcgg',
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

  static Widget createBackground(BuildContext context, bool containIcon) {
    final size = MediaQuery.of(context).size;
    final fondoMorado = Container(
      height: size.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: <Color>[
        Color.fromRGBO(255, 60, 60, 1.0),
        Color.fromRGBO(90, 70, 178, 1.0)
      ])),
    );

    final circulo = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: Color.fromRGBO(255, 255, 255, 0.05)),
    );
    return Stack(
      children: <Widget>[
        fondoMorado,
        Positioned(
          top: 90.0,
          left: 30.0,
          child: circulo,
        ),
        Positioned(
          top: -40.0,
          right: -30.0,
          child: circulo,
        ),
        Positioned(
          bottom: -50.0,
          right: -10.0,
          child: circulo,
        ),
        Container(
          padding: EdgeInsets.only(top: 50.0),
          child: Column(
            children: <Widget>[
              containIcon
                  ? Icon(
                      Icons.person_pin_circle,
                      color: Colors.white,
                      size: 100.0,
                    )
                  : Container(),
              SizedBox(
                height: 10.0,
                width: double.infinity,
              ),
              Text(
                'Intimate',
                style: TextStyle(color: Colors.white, fontSize: 25.0),
              )
            ],
          ),
        )
      ],
    );
  }

  static Widget createTextButton(BuildContext context, String text, Function callback) {
    return Container(
      child: FlatButton(
          onPressed: callback,
          child: Text(
            text,
            style: TextStyle(color: Colors.redAccent),
          )),
    );
  }
}
