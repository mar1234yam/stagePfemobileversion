import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/EntriesController.dart';
import 'home.dart';
import 'login/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: getRememberMeStatus(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          bool rememberMe = snapshot.data!;
          Widget initialRoute = rememberMe ? Home() : LoginPage();

          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: '/',
            getPages: [
              GetPage(name: '/', page: () => initialRoute),
              GetPage(name: '/login', page: () => LoginPage()),
              GetPage(name: '/home', page: () => Home()),
            ],
          );
        } else {
          // Show a loading indicator or splash screen while checking the status
          return CircularProgressIndicator();
        }
      },
    );
  }

  Future<bool> getRememberMeStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool rememberMeStatus = prefs.getBool('rememberMe') ?? false;
    return rememberMeStatus;
  }
}
