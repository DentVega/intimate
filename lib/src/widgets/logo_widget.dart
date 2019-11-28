import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image(
        image: AssetImage('assets/img/logo_capi.png'),
      ),
    );
  }
}
