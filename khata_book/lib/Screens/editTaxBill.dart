import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khata_book/Services/database.dart';

import 'loading.dart';

class editTaxBill extends StatefulWidget {
  String shopId, place, billId, billNumber, amount, comment;

  editTaxBill(
      {this.shopId,
      this.place,
      this.billId,
      this.billNumber,
      this.amount,
      this.comment});

  @override
  _editTaxBillState createState() => _editTaxBillState();
}

class _editTaxBillState extends State<editTaxBill> {
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
          title: Text("Edit in ${widget.billNumber}"),
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
                              initialValue: widget.billNumber,
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
                              initialValue: widget.amount,
                              validator: (val) =>
                                  val.isEmpty ? "Amount can't be empty" : null,
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
                              initialValue: widget.comment,
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
                            SizedBox(
                              height: 10.0,
                            ),
                            RaisedButton(
                              onPressed: () async {
                                if (_key.currentState.validate()) {
                                  setState(() {
                                    _isLoading = true;
                                  });
                                  if (widget.place == "Jewar") {
                                    if (billNumber == null) {
                                      billNumber = widget.billNumber;
                                    }
                                    if (billAmount == null) {
                                      billAmount = widget.amount;
                                    }
                                    if (comment == null) {
                                      comment = widget.comment;
                                    }
                                    await database
                                        .editJewarTaxBill(
                                            widget.shopId,
                                            widget.billId,
                                            billNumber,
                                            billAmount,
                                            "${_date.day}-${_date.month}-${_date.year}",
                                            comment)
                                        .then((val) {
                                      setState(() {
                                        _isLoading = false;
                                      });
                                      Navigator.pop(context);
                                    });
                                  }
                                  if (widget.place == "Tappal") {
                                    if (billNumber == null) {
                                      billNumber = widget.billNumber;
                                    }
                                    if (billAmount == null) {
                                      billAmount = widget.amount;
                                    }
                                    if (comment == null) {
                                      comment = widget.comment;
                                    }
                                    await database
                                        .editTappalTaxBill(
                                            widget.shopId,
                                            widget.billId,
                                            billNumber,
                                            billAmount,
                                            "${_date.day}-${_date.month}-${_date.year}",
                                            comment)
                                        .then((val) {
                                      setState(() {
                                        _isLoading = false;
                                      });
                                      Navigator.pop(context);
                                    });
                                  }
                                  if (widget.place == "Local") {
                                    if (billNumber == null) {
                                      billNumber = widget.billNumber;
                                    }
                                    if (billAmount == null) {
                                      billAmount = widget.amount;
                                    }
                                    if (comment == null) {
                                      comment = widget.comment;
                                    }
                                    await database
                                        .editLocalTaxBill(
                                            widget.shopId,
                                            widget.billId,
                                            billNumber,
                                            billAmount,
                                            "${_date.day}-${_date.month}-${_date.year}",
                                            comment)
                                        .then((val) {
                                      setState(() {
                                        _isLoading = false;
                                      });
                                      Navigator.pop(context);
                                    });
                                  }
                                  if (widget.place == "Jhangirpur") {
                                    if (billNumber == null) {
                                      billNumber = widget.billNumber;
                                    }
                                    if (billAmount == null) {
                                      billAmount = widget.amount;
                                    }
                                    if (comment == null) {
                                      comment = widget.comment;
                                    }
                                    await database
                                        .editJhangirpurTaxBill(
                                            widget.shopId,
                                            widget.billId,
                                            billNumber,
                                            billAmount,
                                            "${_date.day}-${_date.month}-${_date.year}",
                                            comment)
                                        .then((val) {
                                      setState(() {
                                        _isLoading = false;
                                      });
                                      Navigator.pop(context);
                                    });
                                  }
                                }
                              },
                              child: Text("UPDATE"),
                            )
                          ])),
                )));
  }
}
