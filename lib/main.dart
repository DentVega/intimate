import 'package:flutter/material.dart';
import 'package:intimate/src/bloc/provider.dart';
import 'package:intimate/src/pages/dishes_page.dart';
import 'package:intimate/src/pages/event_detail.dart';
import 'package:intimate/src/pages/home_page.dart';
import 'package:intimate/src/pages/login_page.dart';
import 'package:intimate/src/pages/map_location.dart';
import 'package:intimate/src/pages/route_not_found.dart';
import 'package:intimate/src/pages/sigup_page.dart';
import 'package:intimate/src/pages/splash_page.dart';
import 'package:intimate/src/providers/profile.provider.dart';
import 'package:intimate/src/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Intimos',
        initialRoute: 'login',
        routes: {
          '/': (BuildContext context) => SplashPage(),
          'login': (BuildContext context) => LoginPage(),
          'sigup': (BuildContext context) => SigUpPage(),
          'home': (BuildContext context) => HomePage(null),
          'maps': (BuildContext context) => MapLocation(),
          'eventDetail': (BuildContext context) => EventDetail(),
          'dishes': (BuildContext context) => DishesPage()
        },
        onGenerateRoute: (RouteSettings settings) {
          return MaterialPageRoute(
              builder: (BuildContext context) => RouteNotFound());
        },
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
      ),
    );
  }
}
