import 'package:elearning/Screens/Wrapper.dart';
import 'package:elearning/model/user.dart';
import 'package:elearning/service/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'eLearning',
        home: Wrapper()
      ),
    );
  }
}

