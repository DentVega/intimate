import 'package:flutter/material.dart';

class RankingPage extends StatefulWidget {
  @override
  _RankingPageState createState() => _RankingPageState();
}

class _RankingPageState extends State<RankingPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(height: 20.0,),
          CircleAvatar(
            backgroundImage: NetworkImage(
                'https://d500.epimg.net/cincodias/imagenes/2016/07/04/lifestyle/1467646262_522853_1467646344_noticia_normal.jpg'),
            radius: 110.0,
          ),
          SizedBox(height: 15.0,),
          Text('Brian Vega'),
          SizedBox(height: 5.0,),
          Text('1000 puntos', style: TextStyle(fontWeight: FontWeight.bold),),
          _listProfiles()
        ],
      ),
    );
  }

  Widget _listProfiles() {
    return Container();
  }
}
