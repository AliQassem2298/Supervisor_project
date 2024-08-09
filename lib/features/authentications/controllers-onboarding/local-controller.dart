import 'dart:ui';

import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyLocaleController extends GetxController{
  //get sharepref => null;
  final SharedPreferences sharedPref;

  MyLocaleController(this.sharedPref);


 /* Locale intialtang = sharedPref! as LocalegetString("Lang") == "ar" ? locale("ar") : locale("en") ;

  void changeLang(String codeLang){
    Locale locale = Locale(codeLang);
   sharedPref!setString("Lang",codeLang);
    Get.updateLocale(locale);

  }*/

 Locale get initialLocale {
    String? langCode = sharedPref.getString("Lang");
    if (langCode == null) {
      return Locale('en');
    }
    return Locale(langCode);
  }

  void changeLang(String codeLang) {
    Locale locale = Locale(codeLang);
    sharedPref.setString("Lang", codeLang);
    Get.updateLocale(locale);
  }

}