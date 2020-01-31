import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intimate/src/model/profile_model.dart';

class RankingListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var profiles = Provider.of<List<Profile>>(context);
    final _screenSize = MediaQuery.of(context).size;
    return _crearList(profiles, context);
  }

  Widget _crearList(List<Profile> profiles, BuildContext context) {
    if (profiles != null) {
      return ListView(
        children: profiles.map((profile) {
          return Container(
            child: Card(
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: Container(
                padding: EdgeInsets.all(7),
                child: Row(
                  children: <Widget>[
                    SizedBox(width: 10.0),
                    Icon(
                      Icons.account_circle,
                      color: Colors.redAccent,
                      size: 30.0,
                    ),
                    SizedBox(width: 10.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Nombre de usuario: ${profile.nickName}'),
                        SizedBox(height: 5.0),
                        Text(
                          '${profile.score.toString()} Puntos',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    )
                  ],
                ),
              ),
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
