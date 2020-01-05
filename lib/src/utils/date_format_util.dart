import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateFormatUtil {

  static String formatDateYYYYMMDD(DateTime dateTime) {
    var formatter = new DateFormat('yyyy-MM-dd');
    String formatted = formatter.format(dateTime);
    return formatted;
  }

}