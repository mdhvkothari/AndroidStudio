import 'package:flutter/material.dart';

class World extends StatefulWidget {
  var world;
  World({this.world});
  @override
  _WorldState createState() => _WorldState();
}

class _WorldState extends State<World> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink[900],
          title: Text('Global'),
        ),
        body: SafeArea(
          child: Center(
            child: Container(
              child: Text(widget.world),
            ),
          ),
        ),
      ),
    );
  }
}
