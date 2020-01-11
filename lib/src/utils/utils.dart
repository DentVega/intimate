import 'package:flutter/material.dart';

class Utils {
  static void navigateWithName(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }

  static bool isNumeric(String s) {
    if (s.isEmpty) return false;
    final n = num.tryParse(s);
    return (n == null) ? false : true;
  }

}
