import 'package:flutter/material.dart';
import 'package:intimate/src/pages/announcements_list.dart';
import 'package:intimate/src/providers/cloud_firestore_api.dart';
import 'package:provider/provider.dart';

class AnnouncementPage extends StatefulWidget {
  @override
  _AnnouncementPageState createState() => _AnnouncementPageState();
}

class _AnnouncementPageState extends State<AnnouncementPage> {
  final db = CloudFirestoreAPI();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: StreamProvider.value(
        value: db.streamAnnouncement(),
        child: AnnouncementsList(),
      ),
    );
  }
}
