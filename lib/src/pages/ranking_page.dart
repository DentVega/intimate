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
                'https://www.biography.com/.image/t_share/MTIwNjA4NjM0MTk3MjE0NzMy/stan-lee-21101093-1-402.jpg'),
            radius: 110.0,
          ),
          SizedBox(height: 5.0,),
          Text('Brian Vega'),
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
