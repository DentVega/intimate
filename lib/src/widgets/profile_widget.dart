import 'package:flutter/material.dart';
import 'package:intimate/src/model/profile_model.dart';
import 'package:provider/provider.dart';


class ProfileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var profile = Provider.of<Profile>(context);
    return Container(
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
              SizedBox(
                height: 20.0,
              ),
              CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://d500.epimg.net/cincodias/imagenes/2016/07/04/lifestyle/1467646262_522853_1467646344_noticia_normal.jpg'),
                radius: 90.0,
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('Nombre: ${profile.name}', style: TextStyle(fontSize: 30),),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text('Nombre de usuario: ${profile.nickName}', style: TextStyle(fontSize: 20),),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      '${profile.score} puntos',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
    );
  }

}
