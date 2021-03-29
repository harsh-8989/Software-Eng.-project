import 'package:demo_test_app/home_page.dart';
import 'package:demo_test_app/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context)=>HomePage(),
        '/login_page': (context)=>LoginPage(),
      },
    );
  }
}