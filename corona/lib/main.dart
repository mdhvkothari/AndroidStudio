import 'package:animated_splash/animated_splash.dart';
import 'package:corona/homePage.dart';
import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'COVID-19',
      color: Colors.pink[900],
      home: AnimatedSplash(
        imagePath: 'images/19.gif',
        home: MyApp(),
        duration: 3000,
        type: AnimatedSplashType.StaticDuration,
      ),
    );
  }
}
