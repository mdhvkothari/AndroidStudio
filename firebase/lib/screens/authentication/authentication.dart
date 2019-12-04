import 'package:firebase/screens/authentication/registration.dart';
import 'package:flutter/material.dart';
import 'singIn.dart';


class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override

  bool showSignIn = true;
  void toggleView(){
    setState(()=>showSignIn = !showSignIn);
  }

  Widget build(BuildContext context) {
    if(showSignIn){
      return SingIn(toggleView:toggleView);
    }
    else{
      return Register(toggleView:toggleView);
    }
  }
}
