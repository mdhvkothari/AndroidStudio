import 'package:accounts/Service/auth.dart';
import 'package:accounts/warpper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/userModel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.pink),
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}
