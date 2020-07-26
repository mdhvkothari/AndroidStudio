import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rate_book/Screens/particularItemScreen.dart';

class cityScreen extends StatefulWidget {
  String place;

  cityScreen({this.place});

  @override
  _cityScreenState createState() => _cityScreenState();
}

class _cityScreenState extends State<cityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[900],
        title: Text(
          widget.place,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: RaisedButton(
        child: Text("Mustard"),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => particularItemScreen(
                        city: widget.place,
                        item: "Mustard",
                      )));
        },
      ),
    );
  }
}
