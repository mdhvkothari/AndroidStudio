import 'package:elearning/Screens/home.dart';
import 'package:elearning/authenticate/login.dart';
import 'package:elearning/model/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if (user == null) {
      return SignIn();
    } else {
      return HomePage();
    }
  }
}
