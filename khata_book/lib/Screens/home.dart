import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khata_book/Town%20Sceens/jewar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var placeList = ["Jewar", "Tappal", "Jahangirpur", "Local"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[900],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            width: 400,
            height: 400,
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
                  Text(
                    "Accounts on your hand",
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
                  Text("Select Town:"),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Jewar()));
                    },
                    child: Container(
                      height: 50.0,
                      width: 120.0,
                      child: Card(
                        color: Colors.grey,
                        child: Center(
                            child: Text(
                          "Jewar",
                          style: TextStyle(fontSize: 30.0),
                        )),
                      ),
                    ),
                  ),
                  Container(
                    height: 50.0,
                    width: 120.0,
                    child: Card(
                      color: Colors.grey,
                      child: Center(
                          child: Text(
                        "Tappal",
                        style: TextStyle(fontSize: 30.0),
                      )),
                    ),
                  ),
                  Container(
                    height: 50.0,
                    width: 200.0,
                    child: Card(
                      color: Colors.grey,
                      child: Center(
                          child: Text(
                        "Jhanghipur",
                        style: TextStyle(fontSize: 30.0),
                      )),
                    ),
                  ),
                  Container(
                    height: 50.0,
                    width: 120.0,
                    child: Card(
                      color: Colors.grey,
                      child: Center(
                          child: Text(
                        "Local",
                        style: TextStyle(fontSize: 30.0),
                      )),
                    ),
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
