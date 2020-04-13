import 'package:flutter/material.dart';
import 'Screens/listScreen.dart';

void main () => runApp(myApp());

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ToDo",
      debugShowCheckedModeBanner: false,
      home: NoteList(),
    );
  }
}
