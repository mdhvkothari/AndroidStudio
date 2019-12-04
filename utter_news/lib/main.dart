import 'package:flutter/material.dart';
import 'signIn.dart';

void main()=>runApp(Home());

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'uTTerNews',
      theme: ThemeData(primaryColor: Colors.teal),
      home: SingIn(),
    );
  }
}

