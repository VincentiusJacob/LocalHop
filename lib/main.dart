import 'package:flutter/material.dart';
import 'package:flutter_app_demo/pages/landingpage.dart';
import 'package:flutter_app_demo/pages/signin.dart';
import 'package:flutter_app_demo/pages/signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To Do App',
      initialRoute: '/',
      routes: {
        '/': (context) => Landingpage(),
        '/signin': (context) => const SignInPage(),
        '/signup': (context) => const SignupPage(),
     },
    );
  }
}

