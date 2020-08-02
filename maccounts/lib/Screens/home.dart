
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maccounts/TownSceens/Jhangirpur.dart';
import 'package:maccounts/TownSceens/Local.dart';
import 'package:maccounts/TownSceens/Tappal.dart';
import 'package:maccounts/TownSceens/jewar.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[900],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            height: 300,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "khataBook",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 60,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10.0,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(
                      height: 2.0,
                      width: 130.0,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10.0,),
                  Text(
                    "Maheshwari Brothers",
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
                  topLeft: Radius.circular(40), topRight: Radius.circular(40)),
            ),
            child: Center(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Select Town:",
                    style: TextStyle(fontSize: 30.0),
                  ),
                  SizedBox(
                    height: 7.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Jewar(
                                    place: "Jewar",
                                  )));
                    },
                    child: Container(
                      height: 50.0,
                      width: 120.0,
                      child: Card(
                        elevation: 5.0,
                        child: Center(
                            child: Text(
                          "Jewar",
                          style: TextStyle(
                              fontSize: 30.0, color: Colors.pink[900]),
                        )),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 7.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Tappal(
                                    place: "Tappal",
                                  )));
                    },
                    child: Container(
                      height: 50.0,
                      width: 120.0,
                      child: Card(
                        elevation: 5.0,
                        child: Center(
                            child: Text(
                          "Tappal",
                          style: TextStyle(
                              fontSize: 30.0, color: Colors.pink[900]),
                        )),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 7.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Local(
                                    place: "Local",
                                  )));
                    },
                    child: Container(
                      height: 50.0,
                      width: 120.0,
                      child: Card(
                        elevation: 5.0,
                        child: Center(
                            child: Text(
                          "Local",
                          style: TextStyle(
                              fontSize: 30.0, color: Colors.pink[900]),
                        )),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 7.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Jhangirpur(
                                    place: "Jhangirpur",
                                  )));
                    },
                    child: Container(
                      height: 50.0,
                      width: 200.0,
                      child: Card(
                        elevation: 5.0,
                        child: Center(
                            child: Text(
                          "Jhangirpur",
                          style: TextStyle(
                              fontSize: 30.0, color: Colors.pink[900]),
                        )),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 7.0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
