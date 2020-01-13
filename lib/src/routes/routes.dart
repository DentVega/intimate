import 'package:flutter/material.dart';
import 'package:intimate/src/pages/event_detail.dart';
import 'package:intimate/src/pages/home_page.dart';
import 'package:intimate/src/pages/login_page.dart';
import 'package:intimate/src/pages/map_location.dart';
import 'package:intimate/src/pages/sigup_page.dart';
import 'package:intimate/src/pages/splash_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => SplashPage(),
    'login': (BuildContext context) => LoginPage(),
    'sigup': (BuildContext context) => SigUpPage(),
    'home': (BuildContext context) => HomePage(null),
    'maps': (BuildContext context) => MapLocation(),
    'eventDetail': (BuildContext context) => EventDetail()
  };
}
