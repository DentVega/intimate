import 'package:flutter/material.dart';
import 'package:intimate/src/model/devotion_model.dart';
import 'package:intimate/src/pages/devotions_list.dart';
import 'package:intimate/src/providers/cloud_firestore_api.dart';
import 'package:provider/provider.dart';

class DevotionsPage extends StatefulWidget {
  @override
  _DevotionsPageState createState() => _DevotionsPageState();
}

class _DevotionsPageState extends State<DevotionsPage> {
  final db = CloudFirestoreAPI();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Oraciones'),
      ),
      body: StreamProvider<List<Devotion>>.value(
        value: db.streamDevotion(),
        child: DevotionList(),
      ),
    );
  }
}
