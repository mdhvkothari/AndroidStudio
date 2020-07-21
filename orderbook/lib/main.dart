import 'package:flutter/material.dart';

import 'homePage.dart';

void main() => runApp(myApp());

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'orderBook',
      home: HomePage(),
      theme: ThemeData(primarySwatch: Colors.pink),
    );
  }
}
