import 'package:flutter/material.dart';
import 'package:intimate/src/pages/route_not_found.dart';
import 'package:intimate/src/providers/profile.provider.dart';
import 'package:intimate/src/routes/routes.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ProfileProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Intimos',
        initialRoute: '/',
        routes: getApplicationRoutes(),
        onGenerateRoute: (RouteSettings settings) {
          return MaterialPageRoute(
              builder: (BuildContext context) => RouteNotFound());
        },
      ),
    );
  }
}
