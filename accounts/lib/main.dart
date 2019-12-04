import 'package:flutter/material.dart';
import 'package:accounts/screens/all_shops.dart';

void main(){
  runApp(
      MyApp()
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "AnandGeneralStore",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: AllShop(),
    );
  }
}
