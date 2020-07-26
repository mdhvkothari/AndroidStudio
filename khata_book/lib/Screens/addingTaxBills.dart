import 'package:flutter/material.dart';
import 'package:khata_book/Services/database.dart';
import 'package:random_string/random_string.dart';

import 'loading.dart';

class addingTaxBills extends StatefulWidget {
  String shopId,place;

  addingTaxBills({this.shopId,this.place});

  @override
  _addingTaxBillsState createState() => _addingTaxBillsState();
}

class _addingTaxBillsState extends State<addingTaxBills> {
  final _key = GlobalKey<FormState>();
  String billNumber, comment, id, billAmount;
  DateTime _date = DateTime.now();
  bool _isLoading = false;
  Database database = Database();

  Future<Null> selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime(2019),
        lastDate: DateTime(2021));
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
            ? Loading()
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
                              val.isEmpty ? "Enter bill number" : null,
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
                          validator: (val) => val.isEmpty ? "Amount can't be empty" : null,
                          decoration: InputDecoration(
                            hintText: "Enter Amount",
                          ),
                          onChanged: (val) {
                            billAmount = val;
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
                                  ? "${_date.day}-${_date.month}-${_date.year}"
                                  : "SELECT DATE",
                              style: TextStyle(fontSize: 25.0),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.0,),
                        RaisedButton(
                          onPressed: () async {
                            if (_key.currentState.validate()) {
                              setState(() {
                                _isLoading = true;
                              });
                              id = randomAlpha(16);
                              Map<String, dynamic> saleBillMap = {
                                "billNumber": billNumber,
                                "id": id,
                                "billAmount": billAmount,
                                "date": "${_date.day}-${_date.month}-${_date.year}",
                                "comment":comment,
                              };
                              if(widget.place=="Jewar"){
                                await database
                                    .addJewarTaxBill(saleBillMap, id, widget.shopId)
                                    .then((val) {
                                  setState(() {
                                    _isLoading = false;
                                  });
                                  Navigator.pop(context);
                                });
                              }
                              if(widget.place=="Tappal"){
                                await database
                                    .addTappalTaxBill(saleBillMap, id, widget.shopId)
                                    .then((val) {
                                  setState(() {
                                    _isLoading = false;
                                  });
                                  Navigator.pop(context);
                                });
                              }
                              if(widget.place=="Local"){
                                await database
                                    .addLocalTaxBill(saleBillMap, id, widget.shopId)
                                    .then((val) {
                                  setState(() {
                                    _isLoading = false;
                                  });
                                  Navigator.pop(context);
                                });
                              }
                              if (widget.place == "Jhangirpur") {
                                await database
                                    .addJhangirpurTaxBill(
                                    saleBillMap, id, widget.shopId)
                                    .then((val) {
                                  setState(() {
                                    _isLoading = false;
                                  });
                                  Navigator.pop(context);
                                });
                              }
                            }
                          },
                          child: Text("Add"),
                        )
                      ])),
                )));
  }
}
