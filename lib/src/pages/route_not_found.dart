import 'package:flutter/material.dart';

class RouteNotFound extends StatelessWidget {
  final String name = 'Route not Found';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Center(
        child: Text(name),
      ),
    );
  }
}
