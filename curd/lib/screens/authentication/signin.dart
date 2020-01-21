import 'package:curd/screens/authentication/register.dart';
import 'package:curd/services/auth.dart';
import 'package:curd/services/loading.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String email = "";
  String password = "";
  String error = "";

  final AuthService _authService = AuthService();
  final _formkey = GlobalKey<FormState>();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
      appBar: AppBar(
        title: Text("SignIn"),
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Register()));
              },
              icon: Icon(Icons.person),
              label: Text("Register"))
        ],
      ),
      body: Form(
        key: _formkey,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                validator: (val) =>
                val.isEmpty ? "Enter Email Correctly" : null,
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
                validator: (val) => val.isEmpty ? "Enter Password" : null,
                obscureText: true,
                onChanged: (val) {
                  setState(() {
                    password = val;
                  });
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              RaisedButton(
                color: Colors.blue,
                child: Text(
                  "Sign In",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  if (_formkey.currentState.validate()) {
                    setState(() {
                      loading = true;
                    });
                    dynamic result =
                    await _authService.signIn(email, password);
                    if (result == null) {
                      setState(() {
                        loading = false;
                        error = "Could not signIn with those credentials";
                      });
                    }
                  }
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              Center(
                child: Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 15),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
