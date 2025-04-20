import 'package:flutter/material.dart';
import 'package:flutter_app_demo/pages/landingpage.dart';
import 'package:flutter_app_demo/pages/signin.dart';
import 'package:flutter_app_demo/pages/signup.dart';
import 'package:flutter_app_demo/pages/homepage.dart';
import 'package:flutter_app_demo/pages/destinationPage.dart';
import 'package:flutter_app_demo/pages/mainpage.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    print("hello world");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Local Hop!',
      initialRoute: '/',
     routes: {
      '/': (context) => Landingpage(),
      '/destination': (context) => DestinationPage(),
      '/home': (context) => HomePage(),
      '/main': (context) => MainPage(),
      '/signin': (context) => SignInPage(),
      '/signup': (context) => SignupPage(),
    },
    );
  }
}
