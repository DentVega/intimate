import 'package:flutter/material.dart';
import 'package:intimate/src/pages/home_page.dart';
import 'package:intimate/src/pages/login_page.dart';
import 'package:intimate/src/pages/map_location.dart';
import 'package:intimate/src/pages/sigup_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => LoginPage(),
    'login': (BuildContext context) => LoginPage(),
    'sigup': (BuildContext context) => SigUpPage(),
    'home': (BuildContext context) => HomePage(),
    'maps': (BuildContext context) => MapLocation()
  };
}
