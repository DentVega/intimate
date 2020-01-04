import 'package:flutter/material.dart';
import 'package:intimate/src/model/event_model.dart';
import 'package:intimate/src/providers/cloud_firestore_api.dart';
import 'package:intimate/src/pages/event_list.dart';
import 'package:provider/provider.dart';

class EventsPage extends StatefulWidget {
  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  final db = CloudFirestoreAPI();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: StreamProvider<List<Event>>.value(
        value: db.streamEvents(),
        child: EventList(),
      ),
    );
  }
}
