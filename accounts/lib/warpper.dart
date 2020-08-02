import 'package:accounts/authenticate/signIn.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Screens/home.dart';
import 'model/userModel.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if (user==null){
      return signIn();
    }
    else{
      return home(uid: user.uid,);
    }
  }
}
