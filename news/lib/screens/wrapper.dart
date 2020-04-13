import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news/screens/homeScreen.dart';
import 'package:news/screens/loginScreen.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<FirebaseUser>(context);
    print(user);
    if(user==null){
      return LoginScreen();
    }
    else{
      return HomeScreen();
    }
  }
}
