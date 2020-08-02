import 'package:accounts/Screens/loading.dart';
import 'package:accounts/Service/auth.dart';
import 'package:accounts/authenticate/signIn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class register extends StatefulWidget {
  @override
  _registerState createState() => _registerState();
}

class _registerState extends State<register> {
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
            ? Loading(dotColor: Colors.white,)
            : Column(
                children: <Widget>[
                  Container(
                    height: 350,
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
                                      hintText: "Enter your email"),
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
                                      hintText: "Enter Your password"),
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
                                          .register(email, password);
                                      if (result == null) {
                                        setState(() {
                                          error =
                                              "Something is wrong please try after sometime!!";
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: Text(
                                                    "Error",
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
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text(
                                                "Registered!!",
                                                style: TextStyle(
                                                    color: Colors.green),
                                              ),
                                              content: Text(
                                                  "Your account is successfully registered \n Now you can logIn"),
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
                                    }
                                  },
                                  color: Colors.pink[900],
                                  child: Text(
                                    "Register",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(18.0)),
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => signIn()));
                                  },
                                  color: Colors.pink[900],
                                  child: Text(
                                    "logIn",
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
