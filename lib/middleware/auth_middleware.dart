// ignore_for_file: body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../main.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (sharedPreferences!.getString("access_token") != null) {
      return const RouteSettings(name: '/groupList');
    }
    return null;
  }
}
