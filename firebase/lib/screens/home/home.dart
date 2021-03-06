import 'package:firebase/models/brew_model.dart';
import 'package:firebase/screens/home/brew_list.dart';
import 'package:firebase/screens/home/settings_form.dart';
import 'package:firebase/services/auth.dart';
import 'package:firebase/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {

    void _showSettingPanel(){
      showModalBottomSheet(context: context, builder:(context){
          return Container(
            child: SettingsForm(),
          ) ;
      });
    }

    return StreamProvider<List<Brew>>.value(
      value: Database().brews,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text("Firebase"),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
                onPressed: () async {
                  await _auth.signOut();
                },
                icon: Icon(Icons.person),
                label: Text("logout")),
            FlatButton.icon(
              icon: Icon(Icons.settings),
              label: Text('Settings'),
              onPressed: () => _showSettingPanel(),
            )
          ],
        ),
        body: BrewList(),
      ),
    );
  }
}
