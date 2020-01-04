import 'package:flutter/material.dart';
import 'package:intimate/src/model/announcement_model.dart';
import 'package:provider/provider.dart';

class AnnouncementsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var announcements = Provider.of<List<Announcement>>(context);
    final _screenSize = MediaQuery.of(context).size;
    return Container(
      child: SizedBox(
        height: _screenSize.height,
        child: _crearList(announcements),
      ),
    );
  }

  Widget _crearList(List<Announcement> announcements) {
    if (announcements != null) {
      return ListView(
        children: announcements.map((announcement){
          return Column(
            children: <Widget>[
              _cardAnnouncement(announcement),
              SizedBox(
                height: 20.0,
              ),
            ],
          );
        }).toList(),
      );
    }  else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }

  Widget _cardAnnouncement(Announcement announcement) {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Column(children: <Widget>[
        ListTile(
          leading: Icon(Icons.announcement, color: Colors.blue,),
          title: Text(announcement.name),
          subtitle: Text(announcement.detail),
        )
      ],),
    );
  }

}
