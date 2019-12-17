import 'package:firebase/models/brew_model.dart';
import 'package:flutter/material.dart';

class BrewTitle extends StatelessWidget {
  final Brew brew;
  BrewTitle({this.brew});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.brown[brew.strength],
          ),
          title: Text(brew.name),
          subtitle: Text('Take${brew.sugars} sugar(s)'),
        ),
      ),
    );
  }
}
