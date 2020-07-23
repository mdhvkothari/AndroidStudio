import 'package:flutter/material.dart';
import 'package:khata_book/Screens/TappalBills/particularTappalSaleBills.dart';
import 'package:khata_book/Screens/loading.dart';
import 'package:khata_book/Services/database.dart';

import '../editSaleBill.dart';

class tappalSale extends StatefulWidget {
  String shopId, place;

  tappalSale({this.shopId, this.place});

  @override
  _tappalSaleState createState() => _tappalSaleState();
}

class _tappalSaleState extends State<tappalSale> {
  Stream saleBills;
  Database database = Database();

  @override
  void initState() {
    database.getTappalSaleBill(widget.shopId).then((val) {
      setState(() {
        saleBills = val;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(
        stream: saleBills,
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
                                builder: (context) => particularSaleBillTappal(
                                      billId: snapshot
                                          .data.documents[index].data["id"],
                                      shopId: widget.shopId,
                                      billAmount: snapshot.data.documents[index]
                                          .data["billAmount"],
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
                                  ],
                                ),
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
                                                    editSaleBill(
                                                      id: snapshot
                                                          .data
                                                          .documents[index]
                                                          .data["id"],
                                                      billNumber: snapshot
                                                          .data
                                                          .documents[index]
                                                          .data["billNumber"],
                                                      place: widget.place,
                                                      shopId: widget.shopId,
                                                    )));
                                      },
                                      icon: Icon(Icons.edit),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  });
        },
      ),
    );
  }
}
