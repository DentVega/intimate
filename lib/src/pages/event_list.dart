import 'package:flutter/material.dart';
import 'package:intimate/src/model/event_model.dart';
import 'package:intimate/src/utils/date_format_util.dart';
import 'package:intimate/src/widgets/dialog_generator.dart';
import 'package:intimate/src/widgets/widget_util.dart';
import 'package:provider/provider.dart';

class EventList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var events = Provider.of<List<Event>>(context);
    final _screenSize = MediaQuery.of(context).size;
    return Container(
      child: SizedBox(
        height: _screenSize.height,
        child: _crearList(events, context),
      ),
    );
  }

  Widget _crearList(List<Event> events, BuildContext context) {
    if (events != null) {
      return ListView(
        children: events.map((event) {
          return Column(
            children: <Widget>[
              event.typeEvent == 'Kermes'
                  ? _cardKermes(event, context)
                  : _cardEvent(event, context),
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

  Widget _cardEvent(Event event, BuildContext context) {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Row(
        children: <Widget>[
          SizedBox(width: 10.0),
          Icon(
            Icons.event,
            color: Colors.blue,
            size: 30.0,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    event.name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  WidgetUtil.rowDate(context, event),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      FlatButton(
                        child: Text(
                          'Ver detalle',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.blue),
                        ),
                        onPressed: () {
                          DialogGenerator.showDialogVisitEvent(context, event);
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _cardKermes(Event event, BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Navigator.pushNamed(context, 'eventDetail', arguments: event),
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 10.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Stack(
          children: <Widget>[
            FadeInImage(
              image: NetworkImage(event.banner),
              placeholder: AssetImage('assets/img/loading.gif'),
              fadeInDuration: Duration(milliseconds: 200),
              height: 300.0,
              fit: BoxFit.cover,
            ),
          ],
        ),
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
