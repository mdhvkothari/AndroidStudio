import 'package:flutter/material.dart';
import 'package:khata_book/Screens/home.dart';
import 'package:khata_book/Town%20Sceens/jewar.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.pink),
      title: 'khataBook',
      home: Home(),
    );
  }
}