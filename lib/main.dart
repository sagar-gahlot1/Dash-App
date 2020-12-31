import 'package:flutter/material.dart';
import 'package:flutterapp/pages/LoginPage.dart';

import 'package:animated_splash/animated_splash.dart';

import 'pages/SplashPage.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
//   This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new SplashPage(),
      routes: <String, WidgetBuilder>{
        '/LoginPage': (BuildContext context) => new LoginPage()
      },

    );





  }
}
