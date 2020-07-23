import 'package:flutter/material.dart';
import 'package:khata_book/Screens/addingTaxBills.dart';
import 'package:khata_book/Screens/JewarBills/particularTaxBillCredit.dart';
import 'package:khata_book/Screens/editTaxBill.dart';
import 'package:khata_book/Services/database.dart';

import '../loading.dart';

class jewarTax extends StatefulWidget {
  String shopId, place;

  jewarTax({this.shopId, this.place});

  @override
  _jewarTaxState createState() => _jewarTaxState();
}

class _jewarTaxState extends State<jewarTax> {
  Stream taxBills;
  Database database = Database();

  @override
  void initState() {
    database.getJewarTaxBill(widget.shopId).then((val) {
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
                            height: 106.0,
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
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        snapshot.data.documents[index]
                                            .data["comment"],
                                        style: TextStyle(fontSize: 15.0),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      editTaxBill(
                                                        place: widget.place,
                                                        shopId: widget.shopId,
                                                        billId: snapshot
                                                            .data
                                                            .documents[index]
                                                            .data["id"],
                                                        billNumber: snapshot
                                                            .data
                                                            .documents[index]
                                                            .data["billNumber"],
                                                      )));
                                        },
                                        icon: Icon(Icons.edit),
                                      )
                                    ],
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
