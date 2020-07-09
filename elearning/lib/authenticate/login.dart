import 'package:elearning/Screens/loading.dart';
import 'package:elearning/authenticate/register.dart';
import 'package:elearning/service/auth.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  String error="";
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading?Loading(): Scaffold(
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
                            icon: Icon(Icons.email,color: Colors.white,),
                            hintText:'Enter Registered Email',
//                            enabledBorder: OutlineInputBorder(
//                              borderSide: BorderSide(color:Colors.blue,)
//                            ),
//                            focusedBorder: OutlineInputBorder(
//                                borderSide: BorderSide(color:Colors.blue[900],width: 1.0)
//                            )
                          ),
                          validator:(val)=> val.isEmpty?'Enter your Email':null,
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
                              hintText:'Enter Your Password',
                              icon: Icon(Icons.vpn_key,color: Colors.white,)
//                              enabledBorder: OutlineInputBorder(
//                                  borderSide: BorderSide(color:Colors.blue[900])
//                              ),
//                              focusedBorder: OutlineInputBorder(
//                                  borderSide: BorderSide(color:Colors.blue[900],width: 1.0)
//                              )
                          ),
                          validator:(val)=> val.length<6?'Enter a password 6+ chars long':null,
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
                            onPressed: () async {
                              setState(() {
                                loading = true;
                              });
                              if(_formkey.currentState.validate()){
                                dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                                if (result == null){
                                  setState(() {
                                    error = 'COULD NOT SIGNIN WITH THOSE CREDENTIALS';
                                    loading = false;
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
                              'New User?',
                              style: TextStyle(color: Colors.black),
                            ),
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          Register()));
                            },
                          ),
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
