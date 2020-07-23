import 'package:flutter/material.dart';
import 'package:khata_book/Screens/Local/particularTaxBillCredit.dart';
import 'package:khata_book/Services/database.dart';

import '../loading.dart';

class localTax extends StatefulWidget {
  String shopId,place;

  localTax({this.shopId,this.place});

  @override
  _localTaxState createState() => _localTaxState();
}

class _localTaxState extends State<localTax> {
  Stream taxBills;
  Database database = Database();

  @override
  void initState() {
    database.getLocalTaxBill(widget.shopId).then((val) {
      setState(() {
        taxBills = val;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(
        stream: taxBills,
        builder: (context, snapshot) {
          return snapshot.data == null
              ? Loading()
              : ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => particularTaxBill(
                              shopId: widget.shopId,
                              billId: snapshot
                                  .data.documents[index].data["id"],
                              place: widget.place,
                            )));
                  },
                  child: Card(
                      elevation: 5.0,
                      margin: EdgeInsets.all(10.0),
                      child: Container(
                        margin: EdgeInsets.all(10.0),
                        height: 80.0,
                        child: Center(
                          child: Column(
                            children: <Widget>[
                              Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Column(
                                      children: <Widget>[
                                        Text(
                                          "Bill Number:",
                                          style: TextStyle(fontSize: 18.0),
                                        ),
                                        Text(
                                          snapshot.data.documents[index]
                                              .data["billNumber"],
                                          style: TextStyle(fontSize: 27.0),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Text(
                                          "Amount:",
                                          style: TextStyle(fontSize: 18.0),
                                        ),
                                        Text(
                                          snapshot.data.documents[index]
                                              .data["billAmount"],
                                          style: TextStyle(fontSize: 27.0),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Text(
                                          "Date:",
                                          style: TextStyle(fontSize: 18.0),
                                        ),
                                        Text(
                                          snapshot.data.documents[index]
                                              .data["date"],
                                          style: TextStyle(fontSize: 25.0),
                                        ),
                                      ],
                                    ),
                                  ]),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                snapshot
                                    .data.documents[index].data["comment"],
                                style: TextStyle(fontSize: 15.0),
                              ),
                            ],
                          ),
                        ),
                      )),
                );
              });
        },
      ),
    );
  }
}
