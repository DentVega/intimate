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
    return Container(
      child: Text('dsd'),
    );
  }
}
