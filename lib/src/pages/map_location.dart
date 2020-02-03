import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:intimate/src/model/churches_model.dart';
import 'package:intimate/src/providers/cloud_firestore_api.dart';
import 'package:latlong/latlong.dart';
import 'package:user_location/user_location.dart';

//https://pub.dev/packages/flutter_map#-installing-tab-
//https://account.mapbox.com/
//https://pub.dev/packages/flutter_map

class MapLocation extends StatefulWidget {
  @override
  _MapLocationState createState() => _MapLocationState();
}

class _MapLocationState extends State<MapLocation> {
  final map = new MapController();
  UserLocationOptions userLocationOptions;

  String tipoMapa = 'streets';
  final db = CloudFirestoreAPI();
  final positionCapi = LatLng(
      double.parse('-17.374314585719535'), double.parse('-66.13140478571779'));
  BuildContext contextApp;
  List<Marker> markers = [];

  @override
  Widget build(BuildContext context) {
    contextApp = context;
    return Scaffold(
      appBar: AppBar(
        title: Text('Mapa'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.map),
              onPressed: () {
                setState(() {
                  if (tipoMapa == 'streets') {
                    tipoMapa = 'dark';
                  } else if (tipoMapa == 'dark') {
                    tipoMapa = 'light';
                  } else if (tipoMapa == 'light') {
                    tipoMapa = 'outdoors';
                  } else if (tipoMapa == 'outdoors') {
                    tipoMapa = 'satellite';
                  } else {
                    tipoMapa = 'streets';
                  }
                });
              })
        ],
      ),
      body: Stack(
        children: <Widget>[_crearFlutterMap(), _createListLocations()],
      ),
    );
  }

  void userLocation() {
    userLocationOptions = UserLocationOptions(
      context: context,
      showMoveToCurrentLocationFloatingActionButton: true,
      verbose: true,
      mapController: map,
      markers: markers,
    );
  }

  Widget _crearFlutterMap() {
    userLocation();
    return FlutterMap(
      mapController: map,
      options: new MapOptions(center: positionCapi, zoom: 15.00, plugins: [
        UserLocationPlugin(),
      ]),
      layers: [
        _crearMapa(),
        MarkerLayerOptions(markers: markers),
        userLocationOptions
      ],
    );
  }

  _crearMapa() {
    return TileLayerOptions(
        urlTemplate: 'https://api.mapbox.com/v4/'
            '{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}',
        additionalOptions: {
          'accessToken':
              'pk.eyJ1IjoiYnJpYW52aCIsImEiOiJjazR3NXc2bTkxMWI5M21ub3h2OXVmMWE3In0.iWf0dloLi5eblx6h0npcgg',
          'id': 'mapbox.$tipoMapa'
          // streets, dark, light, outdoors, satellite
        });
  }

  Widget _createListLocations() {
    return Container(
      width: 215,
      height: 90,
      padding: EdgeInsets.all(5.0),
      alignment: Alignment(1.0, -1.0),
      child: StreamBuilder(
        stream: db.streamChurles(),
        builder: (BuildContext context, AsyncSnapshot<List<Church>> snapshot) {
          return _createList(snapshot.data);
        },
      ),
    );
  }

  Widget _createList(List<Church> churles) {
    print(churles);
    if (churles != null) {
      return ListView(
        children: churles.map((church) {
          return _location(church);
        }).toList(),
      );
    } else {
      return Container();
    }
  }

  addMarkers(List<Church> churles) {
    churles.forEach((church) {
      markers.add(Marker(
          width: 100.0,
          point: LatLng(church.location.latitude, church.location.longitude),
          height: 100.0,
          builder: (context) => Container(
            child: Icon(
              Icons.location_on,
              size: 45.0,
              color: Theme.of(context).primaryColor,
            ),
          )));
    });
    print('markes: ${markers}');
    print('markes: ${markers.length}');
  }

  Widget _location(Church church) {
    return GestureDetector(
      onTap: () {
        LatLng position =
            LatLng(church.location.latitude, church.location.longitude);
        map.move(position, 15.0);
      },
      child: Container(
        height: 50,
        child: Card(
          elevation: 5.0,
          child: Row(
            children: <Widget>[
              SizedBox(
                width: 10.0,
              ),
              Icon(
                Icons.home,
                color: Colors.red,
              ),
              SizedBox(
                width: 5.0,
              ),
              Text(church.name)
            ],
          ),
        ),
      ),
    );
  }
}
