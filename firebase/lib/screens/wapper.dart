import 'package:firebase/models/usermodels.dart';
import 'package:firebase/screens/authentication/authentication.dart';
import 'package:firebase/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    if(user==null){
      return Authenticate();
    }
    else{
      return Home();
    }
  }
}
