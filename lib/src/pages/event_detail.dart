import 'package:flutter/material.dart';
import 'package:intimate/src/model/event_model.dart';
import 'package:intimate/src/utils/date_format_util.dart';
import 'package:intimate/src/widgets/widget_util.dart';
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
            _createDetailEvent(event, context),
          ]))
        ],
      ),
    );
  }

  Widget _createAppBar(Event event) {
    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.redAccent,
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

  Widget _createDetailEvent(Event event, BuildContext context) {
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
          _locationEvent(event, context),
          SizedBox(height: 20.0),
          Text(
            'Te Esperamos',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.redAccent),
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
              color: Colors.red,
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

  Widget _locationEvent(Event event, BuildContext context) {
    if (event.location == null) {
      return Container();
    } else {
      var latitude = event.location.latitude;
      var longitude = event.location.longitude;
      return WidgetUtil.location(context, LatLng(latitude, longitude), 300);
    }
  }

}
