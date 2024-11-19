import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_brillian_11pplg2/bindings/bindings.dart';
import 'package:pas1_mobile_brillian_11pplg2/navigasi/dhasboardpage.dart';
import 'package:pas1_mobile_brillian_11pplg2/navigasi/loginpage.dart';
import 'package:pas1_mobile_brillian_11pplg2/splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      getPages: [
        GetPage(
          name: '/splash',
          page: () => SplashScreen(imagePath: 'assets/logoo.png'),
        ),
        GetPage(
          name: '/',
          page: () => LoginPage(),
        ),
        GetPage(
          name: '/dashboard',
          page: () => DashboardPage(),
          binding: MyBindings(),
        ),
      ],
    );
  }
}
