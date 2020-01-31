import 'package:flutter/material.dart';
import 'package:intimate/src/model/devotion_model.dart';
import 'package:provider/provider.dart';

class DevotionList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var devotions = Provider.of<List<Devotion>>(context);
    final _screenSize = MediaQuery.of(context).size;
    return Container(
      child: SizedBox(
        height: _screenSize.height,
        child: _crearList(devotions, context),
      ),
    );
  }

  Widget _crearList(List<Devotion> devotions, BuildContext context) {
    if (devotions != null) {
      return ListView(
        children: devotions.map((devotion) {
          return Card(
            elevation: 5.0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
            child: Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                Text(devotion.brother),
                  SizedBox(height: 10.0,),
                  Text(devotion.devotion),
              ],),
            ),
          );
        }).toList(),
      );
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }

}
