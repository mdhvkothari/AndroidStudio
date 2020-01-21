import 'package:curd/model/userModel.dart';
import 'package:curd/screens/authentication/signin.dart';
import 'package:curd/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    if(user == null){
     return SignIn();
    }
    else{
      return Home();
    }
  }
}
