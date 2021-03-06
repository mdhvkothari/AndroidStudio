import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:skype_clone/Resources/firebase_repository.dart';
import 'package:skype_clone/screens/home_screen.dart';
import 'package:skype_clone/screens/login_screen.dart';
import 'package:skype_clone/screens/page_view/search_screen.dart';

void main()=>runApp(MyApp());


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FirebaseRepository _repository = FirebaseRepository();
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "SkypeClone",
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/search_screen' : (context) => SearchScreen(),
      },
      home: FutureBuilder(
        future: _repository.getCurrentUser(),
        builder: (context,AsyncSnapshot<FirebaseUser> snapshot){
          if(snapshot.hasData){
            return HomeScreen();
          }
          else{
            return LoginScreen();
          }
        },
    
      ),
    );
  }
}