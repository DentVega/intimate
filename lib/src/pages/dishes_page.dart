import 'package:flutter/material.dart';
import 'package:intimate/src/model/dishe_model.dart';
import 'package:intimate/src/model/event_model.dart';
import 'package:intimate/src/pages/dishe_list.dart';
import 'package:intimate/src/providers/cloud_firestore_api.dart';
import 'package:provider/provider.dart';

class DishesPage extends StatefulWidget {
  @override
  _DishesPageState createState() => _DishesPageState();
}

class _DishesPageState extends State<DishesPage> {
  final db = CloudFirestoreAPI();

  @override
  Widget build(BuildContext context) {
    Event event = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(event.name),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: StreamProvider<List<Dishe>>.value(
          value: db.streamDishes(event.uid),
          child: DisheList(),
        ),
      ),
    );
  }
}
