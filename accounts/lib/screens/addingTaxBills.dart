import 'package:accounts/Service/database.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

import 'loading.dart';

class addingTaxBills extends StatefulWidget {
  String uid, id;

  addingTaxBills({this.id, this.uid});

  @override
  _addingTaxBillsState createState() => _addingTaxBillsState();
}

class _addingTaxBillsState extends State<addingTaxBills> {
  final _key = GlobalKey<FormState>();
  String billNumber, billAmount, comment, id;
  DateTime _date = DateTime.now();
  bool _isLoading = false;
  Database database = Database();
  DateTime picked;
  Future<Null> selectDate(BuildContext context) async {
    picked = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime(2019),
        lastDate: DateTime(2024));
    setState(() {
      _date = picked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("addTaxBill"),
          backgroundColor: Colors.pink[900],
        ),
        body: _isLoading
            ? Loading(
          dotColor: Colors.white,
        )
            : Form(
            key: _key,
            child: SingleChildScrollView(
              child: Container(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        TextFormField(
                          validator: (val) =>
                          val.isEmpty ? "Provide bill number" : null,
                          decoration: InputDecoration(
                            hintText: "Enter bill number",
                          ),
                          onChanged: (val) {
                            billNumber = val;
                          },
                          keyboardType: TextInputType.number,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          validator: (val) =>
                          val.isEmpty ? "Enter some comment" : null,
                          decoration: InputDecoration(
                            hintText: "Comment",
                          ),
                          onChanged: (val) {
                            comment = val;
                          },
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          validator: (val) =>
                          val.isEmpty ? "Provide bill amount" : null,
                          decoration: InputDecoration(
                            hintText: "Enter bill amount",
                          ),
                          onChanged: (val) {
                            billAmount = val;
                          },
                          keyboardType: TextInputType.number,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          children: <Widget>[
                            IconButton(
                              icon: Icon(
                                Icons.calendar_today,
                              ),
                              onPressed: () {
                                selectDate(context);
                              },
                              iconSize: 30.0,
                            ),
                            SizedBox(width: 20.0),
                            Text(
                              "$_date" != null
                                  ? "${_date.day}/${_date.month}/${_date.year}"
                                  : "SELECT DATE",
                              style: TextStyle(fontSize: 25.0),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0)),
                          onPressed: () async {
                            if (_key.currentState.validate()) {
                              setState(() {
                                _isLoading = true;
                              });
                              id = randomAlpha(16);
                              Map<String, dynamic> saleBillMap = {
                                "billNumber": billNumber,
                                "id": id,
                                "date":
                                "${_date.day}-${_date.month}-${_date.year}",
                                "billAmount": billAmount,
                                "comment": comment,
                              };
                              await database
                                  .addingtaxBills(widget.uid, widget.id,
                                  id, saleBillMap)
                                  .then((val) {
                                setState(() {
                                  _isLoading = false;
                                });
                                Navigator.pop(context);
                              });
                            }
                          },
                          child: Text(
                            "Add",
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.pink[900],
                        )
                      ])),
            )));
  }
}
