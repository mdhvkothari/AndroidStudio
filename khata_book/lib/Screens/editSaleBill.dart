import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khata_book/Services/database.dart';

import 'loading.dart';

class editSaleBill extends StatefulWidget {
  String id, billNumber, place, shopId, amount, comment;

  editSaleBill(
      {this.id,
      this.billNumber,
      this.place,
      this.shopId,
      this.amount,
      this.comment});

  @override
  _editSaleBillState createState() => _editSaleBillState();
}

class _editSaleBillState extends State<editSaleBill> {
  final _key = GlobalKey<FormState>();
  String billNumber, billAmount, comment, id;
  DateTime date = DateTime.now();
  bool _isLoading = false;
  Database database = Database();

  Future<Null> selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: date,
        firstDate: DateTime(2019),
        lastDate: DateTime(2021));
    setState(() {
      date = picked;
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
                              height: 10.0,
                            ),
                            TextFormField(
                              initialValue: widget.amount,
                              validator: (val) =>
                                  val.isEmpty ? "Enter bill amount" : null,
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
                                  "$date" != null
                                      ? "${date.day}-${date.month}-${date.year}"
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
                                        .updateJewarSaleBill(
                                            widget.shopId,
                                            widget.id,
                                            billNumber,
                                            billAmount,
                                            comment,
                                            "${date.day}-${date.month}-${date.year}")
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
                                        .updateTappalSaleBill(
                                            widget.shopId,
                                            widget.id,
                                            billNumber,
                                            billAmount,
                                            comment,
                                            "${date.day}-${date.month}-${date.year}")
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
                                        .updateLocalSaleBill(
                                            widget.shopId,
                                            widget.id,
                                            billNumber,
                                            billAmount,
                                            comment,
                                            "${date.day}-${date.month}-${date.year}")
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
                                        .updateJhangirpurSaleBill(
                                            widget.shopId,
                                            widget.id,
                                            billNumber,
                                            billAmount,
                                            comment,
                                            "${date.day}-${date.month}-${date.year}")
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
