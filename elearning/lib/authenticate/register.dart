import 'package:elearning/authenticate/login.dart';
import 'package:elearning/service/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(elevation: 0.0,),
        backgroundColor: Colors.blue,
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                    child: Image.asset(
                  'logo.png',
                  height: 200,
                  width: 200,
                )),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Enter your email',
                            icon: Icon(Icons.email,color: Colors.white,)
                          ),
                          validator: (val) => val.isEmpty ?'Enter an Email' :null,
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
                          decoration: InputDecoration(
                              hintText: 'Enter your Password',
                              icon: Icon(Icons.vpn_key,color: Colors.white,)
                          ),
                          obscureText: true,
                          validator: (val)=> val.length<6?'Enter a password 6+ chars long':null,
                          onChanged: (val) {
                            setState(() {
                              password = val;
                            });
                          },
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: RaisedButton(
                            elevation: 10.0,
                            color: Colors.blue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.white)),
                            child: Text(
                              'Register',
                              style: TextStyle(color: Colors.black),
                            ),
                            onPressed: () async {
                              if(_formkey.currentState.validate()){
                                  dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                                  if (result==null){
                                    setState(() {
                                      error ='Please check your email and password';
                                    });
                                  }
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: RaisedButton(
                              elevation: 10.0,
                              color: Colors.blue,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: BorderSide(color: Colors.white)),
                              child: Text(
                                'SignIn',
                                style: TextStyle(color: Colors.black),
                              ),
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            SignIn()));
                              }),
                        ),
                        SizedBox(height: 10.0,),
                        Text(error,style: TextStyle(color: Colors.red,fontSize: 14.0),)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
