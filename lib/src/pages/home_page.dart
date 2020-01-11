import 'package:flutter/material.dart';
import 'package:intimate/src/pages/announcement_page.dart';
import 'package:intimate/src/pages/events_page.dart';
import 'package:intimate/src/pages/ranking_page.dart';

class HomePage extends StatefulWidget {
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
          child: Container(),
          decoration: BoxDecoration(
            color: Colors.redAccent,
              image: DecorationImage(
                  image: AssetImage('assets/menu-img.jpg'),
                  fit: BoxFit.cover)
          ),
        ),
        ListTile(
          leading: Icon(Icons.people, color: Colors.redAccent,),
          title: Text('Perfil'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.pages, color: Colors.redAccent,),
          title: Text('Anuncios'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.map, color: Colors.redAccent,),
          title: Text('Ubicaciones'),
          onTap: () {
            Navigator.pushNamed(context, 'maps');
          },
        ),
        ListTile(
          leading: Icon(Icons.exit_to_app, color: Colors.redAccent,),
          title: Text('Cerrar Sesion'),
          onTap: () => signOff(),
        )
      ],
    );
  }

  void _onItemTapeed(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void signOff() {}
}
