

import'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class TDeviceUtils{
  static void hideKeyboard(BuildContext context){
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static Future<void> setStatusBarColor(Color color) async{
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: color),
    );


  }
  static void setFuullScreen(bool enable){
    SystemChrome.setEnabledSystemUIMode(enable ? SystemUiMode.immersiveSticky : SystemUiMode.edgeToEdge);
  }

  static double getScreenHieght(){
    return MediaQuery.of(Get.context!).size.height;
  }

  static double getScreenWidth(BuildContext context){
    return MediaQuery.of(context).size.width;

  }
  static double getAppBarHeight(){
    return kToolbarHeight;
  }

  static double getBottomNavigationBarHeight(){
    return kBottomNavigationBarHeight;
  }


}