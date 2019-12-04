import 'package:firebase/services/auth.dart';
import 'package:flutter/material.dart';

class SingIn extends StatefulWidget {
  final Function toggleView;
  SingIn({this.toggleView});

  @override
  _SingInState createState() => _SingInState();
}

class _SingInState extends State<SingIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String email='';
  String password='';
  String error='a';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign into app!!'),
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () {
                widget.toggleView();
              },
              icon: Icon(Icons.person),
              label: Text('Regsiter'))
        ],
      ),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  validator: (val)=> val.isEmpty? "Enter an Email": null,
                  onChanged: (val) {
                    setState(() {
                      email = val;
                    });
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  obscureText: true,
                  validator: (val)=> val.length<6? "Enter a password 6+ chars long": null,
                  onChanged: (val) {
                    password = val;
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                RaisedButton(
                  color: Colors.pink[400],
                  child: Text(
                    'SignIn',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    if(_formKey.currentState.validate()){
                      dynamic result = await _auth.registerWithEmailandPassword(email, password);
                      if(result==null){
                        setState(() => error = "Enter valid Email");
                      }
                    }
                  },
                ),
                SizedBox(height: 12.0,),
                Text(
                  error,
                  style: TextStyle(color: Colors.red,fontSize: 14.0),
                )
              ],
            ),
          )),
    );
  }
}
