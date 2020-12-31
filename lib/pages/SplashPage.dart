import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
class SplashPage extends StatefulWidget {

  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {

// THIS FUNCTION WILL NAVIGATE FROM SPLASH SCREEN TO HOME SCREEN.    // USING NAVIGATOR CLASS.

  void navigationToNextPage() {
    Navigator.pushNamed(context, '/LoginPage');
  }

  startSplashScreenTimer() async {
    var _duration = new Duration(seconds: 11);
    return new Timer(_duration, navigationToNextPage);
  }

  @override
  void initState() {
    super.initState();
    startSplashScreenTimer();
  }

  @override
  Widget build(BuildContext context) {

    // To make this screen full screen.
    // It will hide status bar and notch.
    SystemChrome.setEnabledSystemUIOverlays([]);

    // full screen image for splash screen.
    return Container(
      decoration: new BoxDecoration(color: Colors.white),
        child: new Image.asset("assets/images/index.gif"),


    );


  }
}
