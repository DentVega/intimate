import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intimate/src/pages/announcement_page.dart';
import 'package:intimate/src/pages/events_page.dart';
import 'package:intimate/src/pages/ranking_page.dart';
import 'package:intimate/src/providers/AuthService.dart';
import 'package:intimate/src/providers/authentication.dart';
import 'package:intimate/src/widgets/widget_util.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  final FirebaseUser currentUser;

  HomePage(this.currentUser);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final List<Widget> _widgetOptions = <Widget>[
    EventsPage(),
    RankingPage(),
    AnnouncementPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio'),
      ),
      drawer: Drawer(
        child: _createDrawer(context),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.event), title: Text('Eventos')),
          BottomNavigationBarItem(
              icon: Icon(Icons.star), title: Text('Ranking')),
          BottomNavigationBarItem(
              icon: Icon(Icons.announcement), title: Text('Anuncios'))
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.redAccent,
        onTap: _onItemTapeed,
      ),
    );
  }

  Widget _createDrawer(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
            child: Container(
              child: Center(
                  child: Column(
                children: <Widget>[
                  Text(
                    'ÍNTIMOS',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 25.0),
                  ),
                  SizedBox(
                    height: 10.0,
                    width: double.infinity,
                  ),
                  Text(
                    'La Banda',
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  )
                ],
              )),
            ),
            decoration: BoxDecoration(
                color: Colors.redAccent,
                image: DecorationImage(
                    image: AssetImage('assets/menu-img.jpg'),
                    fit: BoxFit.cover))),
        ListTile(
          leading: Icon(
            Icons.people,
            color: Colors.redAccent,
          ),
          title: Text('Perfil'),
          onTap: () {
            Navigator.pushNamed(context, 'profile');
          },
        ),
        ListTile(
          leading: Icon(
            Icons.music_note,
            color: Colors.redAccent,
          ),
          title: Text('Canciones'),
          onTap: () {
            Navigator.pushNamed(context, 'songs');
          },
        ),
        ListTile(
          leading: Icon(
            Icons.pages,
            color: Colors.redAccent,
          ),
          title: Text('Oraciones'),
          onTap: () {
            Navigator.pushNamed(context, 'devotions');
          },
        ),
        ListTile(
          leading: Icon(
            Icons.map,
            color: Colors.redAccent,
          ),
          title: Text('Ubicaciones'),
          onTap: () {
            Navigator.pushNamed(context, 'maps');
          },
        ),
        ListTile(
          leading: Icon(
            Icons.exit_to_app,
            color: Colors.redAccent,
          ),
          title: Text('Cerrar Sesion'),
          onTap: () {
            signOff(context);
          },
        )
      ],
    );
  }

  void _onItemTapeed(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void signOff(BuildContext context) async {
    Auth auth = new Auth();
    auth.signOut();
    Navigator.pushReplacementNamed(context, "login");
  }
}
