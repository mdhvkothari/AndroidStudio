import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news/resources/firebase_method.dart';
import 'package:news/screens/wrapper.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'uTTerNews',
      debugShowCheckedModeBanner: false,
      home: StreamProvider<FirebaseUser>.value(
          value: FirebaseMethod().getUser,
          child: Wrapper()),
    );
  }
}
