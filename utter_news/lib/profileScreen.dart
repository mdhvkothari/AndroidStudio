import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:utter_news/SourceScreen.dart';
import 'package:utter_news/signIn.dart';

class ProfileScreen extends StatelessWidget {
  final UserDetails detailsUser;

  ProfileScreen({this.detailsUser});

  @override
  Widget build(BuildContext context) {
    final GoogleSignIn _gSignIn = GoogleSignIn();

    return Scaffold(
      appBar: AppBar(
        title: Text('uTTerNews'),
        actions: <Widget>[
          IconButton(
            icon:Icon(Icons.exit_to_app),
            onPressed: (){
              _gSignIn.signOut();
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 100.0,
            ),
            Text(
              'Welcome, ' + detailsUser.userName,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20.0,
            ),
            CircleAvatar(
              backgroundImage: NetworkImage(detailsUser.photoUrl),
              radius: 80.0,
            ),
            SizedBox(
              height: 50.0,
            ),
            Text(
              'Name : ' + detailsUser.userName,
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              'Email : ' + detailsUser.userEmail,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30.0,
            ),
            RaisedButton(
                splashColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                color: Colors.teal,
                child: Text(
                  'GetNews',
                  style: TextStyle(color: Colors.black, fontSize: 18.0),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SourceScreen()));
                }),
          ],
        ),
      ),
    );
  }
}
