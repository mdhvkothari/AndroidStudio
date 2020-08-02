import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Screens/loading.dart';
import 'Services/auth.dart';

class signIn extends StatefulWidget {
  @override
  _signInState createState() => _signInState();
}

class _signInState extends State<signIn> {
  String email, password, error;
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[900],
      body: SingleChildScrollView(
        child: _isLoading
            ? Loading()
            : Column(
                children: <Widget>[
                  Container(
                    height: 400,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Accounts",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 60,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: Container(
                              height: 2.0,
                              width: 130.0,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "Your digital Khata",
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40)),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(50.0),
                        child: Center(
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                TextFormField(
                                  validator: (val) => val.isEmpty
                                      ? "Enter your mail first!!"
                                      : null,
                                  decoration: InputDecoration(
                                      hintText: "Enter your registered email"),
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
                                  validator: (val) => val.length < 6
                                      ? "Password should be of atleast 6 characters!!"
                                      : null,
                                  decoration: InputDecoration(
                                      hintText: "Enter your password"),
                                  obscureText: true,
                                  onChanged: (val) {
                                    setState(() {
                                      password = val;
                                    });
                                  },
                                ),
                                SizedBox(
                                  height: 30.0,
                                ),
                                RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(18.0)),
                                  onPressed: () async {
                                    if (_formKey.currentState.validate()) {
                                      setState(() {
                                        _isLoading = true;
                                      });
                                      dynamic result = await _authService
                                          .signin(email, password);
                                      if (result == null) {
                                        setState(() {
                                          error =
                                              "Please check your email and password";
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: Text(
                                                    "Error !!",
                                                    style: TextStyle(
                                                        color: Colors.red),
                                                  ),
                                                  content: Text(error),
                                                  actions: <Widget>[
                                                    FlatButton(
                                                      child: Text("OK"),
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                    )
                                                  ],
                                                );
                                              });
                                        });
                                      }
                                      setState(() {
                                        _isLoading = false;
                                      });
                                    }
                                  },
                                  color: Colors.pink[900],
                                  child: Text(
                                    "SignIn",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )),
                ],
              ),
      ),
    );
  }
}
