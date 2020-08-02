import 'package:flutter/material.dart';

class taxBills extends StatefulWidget {
  String uid, id;
  taxBills({this.uid,this.id});
  @override
  _taxBillsState createState() => _taxBillsState();
}

class _taxBillsState extends State<taxBills> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Tax Bills"),
    );
  }
}
