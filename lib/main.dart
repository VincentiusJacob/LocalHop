import 'package:flutter/material.dart';
import 'package:flutter_app_demo/pages/landingpage.dart';
import 'package:flutter_app_demo/pages/signin.dart';
import 'package:flutter_app_demo/pages/signup.dart';
import 'package:flutter_app_demo/pages/homepage.dart';
import 'package:flutter_app_demo/pages/destinationPage.dart';
import 'package:flutter_app_demo/pages/mainpage.dart';
import 'package:flutter_app_demo/model/user_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Local Hop!',
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (_) => Landingpage());
          case '/destination':
            return MaterialPageRoute(builder: (_) => DestinationPage());
          case '/home':
            return MaterialPageRoute(builder: (_) => HomePage());
          case '/signin':
            return MaterialPageRoute(builder: (_) => SignInPage());
          case '/signup':
            return MaterialPageRoute(builder: (_) => SignupPage());
          case '/main':
            final user = settings.arguments as UserModel?;
            return MaterialPageRoute(
              builder: (_) => MainPage(user: user),
            );
          default:
            return null;
        }
      },
    );
  }
}
