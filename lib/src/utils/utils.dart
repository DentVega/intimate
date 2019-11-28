import 'package:flutter/material.dart';

class Utils {
  static void navigateWithName(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }
}
