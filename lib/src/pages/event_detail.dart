import 'package:flutter/material.dart';
import 'package:intimate/src/model/event_model.dart';
import 'package:intimate/src/utils/date_format_util.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class EventDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Event event = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          _createAppBar(event),
          SliverList(
              delegate: SliverChildListDelegate([
            SizedBox(
              height: 10.0,
            ),
            _createDetailEvent(event),
          ]))
        ],
      ),
    );
  }

  Widget _createAppBar(Event event) {
    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.indigoAccent,
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          event.name,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        background: FadeInImage(
          placeholder: AssetImage('assets/img/loading.gif'),
          image: NetworkImage(event.banner),
          fadeInDuration: Duration(milliseconds: 200),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _createDetailEvent(Event event) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: <Widget>[
          _createDateEvent(event),
          SizedBox(
            height: 20.0,
          ),
          Text(event.detail),
          SizedBox(
            height: 20.0,
          ),
          _locationEvent(event),
          SizedBox(height: 20.0),
          Text(
            'Te Esperamos',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.blue),
          ),
          SizedBox(height: 30.0),
        ],
      ),
    );
  }

  Widget _createDateEvent(Event event) {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Container(
        padding: EdgeInsets.all(15.0),
        child: Row(
          children: <Widget>[
            Icon(
              Icons.date_range,
              color: Colors.blue,
            ),
            SizedBox(
              width: 10.0,
            ),
            Text('Fecha: '),
            Text(DateFormatUtil.formatDateYYYYMMDD(event.date.toDate()))
          ],
        ),
      ),
    );
  }

  Widget _locationEvent(Event event) {
    if (event.location == null) {
      return Container();
    } else {
      var latitude = event.location.latitude;
      var longitude = event.location.longitude;
      return Container(
        height: 300.0,
        child: FlutterMap(
          options: new MapOptions(center: LatLng(latitude, longitude)),
          layers: [_createMap(), _createMarket(LatLng(latitude, longitude))],
        ),
      );
    }
  }

  _createMap() {
    return TileLayerOptions(
        urlTemplate: 'https://api.mapbox.com/v4/'
            '{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}',
        additionalOptions: {
          'accessToken':
              '',
          'id': 'mapbox.streets'
          // streets, dark, light, outdoors, satellite
        });
  }

  _createMarket(LatLng positionEvent) {
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
