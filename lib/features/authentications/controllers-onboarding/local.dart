import 'package:get/get.dart';

class MyLocale implements Translations{
  @override
  // TODO: implement keys

  Map<String, Map<String, String>> get keys => {
    "ar" : {"1" : "الاعدادات", "2": "عربي", "3": "انكليزي", "4": "الوضع الليلي", "5": "الوضع النهاري"},
    "en" : {"1" : "Settings", "2": "Arabic" , "3": "English", "4": "Dark Mode", "5": "Light Mode"},

  };


}