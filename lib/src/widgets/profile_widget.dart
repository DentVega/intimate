import 'package:flutter/material.dart';
import 'package:intimate/src/model/profile_model.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ProfileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var profile = Provider.of<Profile>(context);
    return Container(
      color: Colors.red,
      child: Column(
        children: <Widget>[
          profile != null ? _profileUser(profile) : Container(),
        ],
      ),
    );
  }

  Widget _profileUser(Profile profile) {
    return Container(
        padding: EdgeInsets.all(10.0),
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Card(
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(150.0)),
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://d500.epimg.net/cincodias/imagenes/2016/07/04/lifestyle/1467646262_522853_1467646344_noticia_normal.jpg'),
                    radius: 90.0,
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '${profile.name}',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    _bodyProfile(profile)
                  ],
                ),
              )
            ],
          ),
        ));
  }

  Widget _bodyProfile(Profile profile) {
    return Container(
      width: double.infinity,
      child: Column(
        children: <Widget>[
          Text(
            DateFormat('yyyy-MM-dd').format(profile.dateBirth.toDate()),
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(
            '${profile.nickName}',
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5.0,
          ),
          Card(
            elevation: 5.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(150.0)),
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: Text(
                '${profile.score} puntos',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: 25.0,
          ),
          RaisedButton(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
              child: Text('Editar Datos'),
            ),
            color: Colors.white,
            textColor: Colors.red,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
