import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:intl/intl.dart';

class THelperFunctions {
  static Color? getColor(String value) {
    // Define your product specific colors here and it will match the attribute colors and show specific

    if (value == 'Green') {
      return Colors.green;
    } else if (value == 'Red') {
      return Colors.red;
    } else if (value == 'Blue') {
      return Colors.blue;
    } else if (value == 'Pink') {
      return Colors.pink;
    } else if (value == 'Grey') {
      return Colors.grey;
    } else if (value == 'Purple') {
      return Colors.purple;
    } else if (value == 'Black') {
      return Colors.black;
    } else if (value == 'White') {
      return Colors.white;}
      else if (value=='Brown') {
      return Colors.brown;
    }
    else if (value=='Teal'){
      return Colors.teal;
    } else {
      return null;
    }

  }
  static bool isDarkMode (BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Size screenSize() {
    return MediaQuery.of(Get.context!).size;
  }
/*
  static double screenHeight() {
    return MediaQuery.of(Get.context!).size.height;
  }


  static double screenWidth() {
    return MediaQuery.of(Get.context!).size.width;
  }*/
  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }






}