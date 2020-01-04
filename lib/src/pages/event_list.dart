import 'package:flutter/material.dart';
import 'package:intimate/src/model/event_model.dart';
import 'package:provider/provider.dart';

class EventList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var events = Provider.of<List<Event>>(context);
    final _screenSize = MediaQuery.of(context).size;
    return Container(
      child: SizedBox(
        height: _screenSize.height,
        child: _crearList(events),
      ),
    );
  }

  Widget _crearList(List<Event> events) {
    if (events != null) {
      return ListView(
        children: events.map((event) {
          return Column(
            children: <Widget>[
              event.typeEvent == 'Kermes'
                  ? _cardKermes(event)
                  : _cardEvent(event),
              SizedBox(
                height: 15.0,
              ),
            ],
          );
        }).toList(),
      );
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }

  Widget _cardEvent(Event event) {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.event, color: Colors.blue,),
            title: Text(event.name),
            subtitle: Text(event.detail),
            onTap: () {},
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text('Ver detalle'),
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _cardKermes(Event event) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 10.0,
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage(
                event.banner),
            placeholder: AssetImage('assets/img/loading.gif'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 300.0,
            fit: BoxFit.cover,
          ),
          Container(padding: EdgeInsets.all(20.0), child: Column(
            children: <Widget>[
              Text(event.name),
            ],
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text('Ver detalle'),
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _crearListBuilder(List<Event> events) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: events.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.movie),
          );
        });
  }
}
