import 'package:flutter/material.dart';
import 'package:intimate/src/model/dishe_model.dart';
import 'package:provider/provider.dart';

class DisheList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var dishes = Provider.of<List<Dishe>>(context);
    final _screenSize = MediaQuery.of(context).size;
    return Container(
      child: SizedBox(
        height: _screenSize.height,
        child: _createList(dishes, context),
      ),
    );
  }

  Widget _createList(List<Dishe> dishes, BuildContext context) {
    if (dishes != null) {
      return ListView(
        children: dishes.map((dishe) {
          return Column(
            children: <Widget>[
              _cardDishe(dishe)
            ],
          );
        }).toList(),
      );
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return Container(
      child: Text('dsd'),
    );
  }

  Widget _cardDishe(Dishe dishe) {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(dishe.name),
          )
        ],
      ),
    );
  }

}
