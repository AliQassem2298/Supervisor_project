import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_2tamayoz/features/authentications/screens/widgets/grouplist_screen.dart';
import 'package:project_2tamayoz/features/authentications/screens/widgets/login.dart';
import 'package:project_2tamayoz/middleware/auth_middleware.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? sharedPreferences;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(
            name: '/',
            page: () => const LoginScreen(),
            middlewares: [AuthMiddleware()]),
        GetPage(name: '/groupList', page: () => const GroupListScreen()),
      ],
    );
  }
}
