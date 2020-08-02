import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Services/auth.dart';
import 'model/userModel.dart';
import 'wrapper.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
        value: AuthService().user,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primarySwatch: Colors.pink),
          title: 'anandAccount',
          home:Wrapper(),
        ));
  }
}
