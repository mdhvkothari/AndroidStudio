import 'package:flutter/material.dart';

class saleBills extends StatefulWidget {
  String uid,id;
  saleBills({this.id,this.uid});
  @override
  _saleBillsState createState() => _saleBillsState();
}

class _saleBillsState extends State<saleBills> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("sale bills"),
    );
  }
}
