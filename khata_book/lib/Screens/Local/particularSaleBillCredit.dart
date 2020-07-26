import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khata_book/Screens/addCreditSaleBillDetails.dart';
import 'package:khata_book/Screens/editInSaleCredit.dart';
import 'package:khata_book/Screens/loading.dart';
import 'package:khata_book/Services/database.dart';

class particularSaleBill extends StatefulWidget {
  String billId, shopId, billAmount, place;

  particularSaleBill({this.billId, this.shopId, this.billAmount, this.place});

  @override
  _particularSaleBillState createState() => _particularSaleBillState();
}

class _particularSaleBillState extends State<particularSaleBill> {
  Stream particularCreditBill;
  String totalCreditedAmount;
  Database database = Database();
  int AmountCredited = 0;

  @override
  void initState() {
    database
        .getLocalParticularSaleBillCredit(widget.shopId, widget.billId)
        .then((val) {
      setState(() {
        particularCreditBill = val;
      });
    });
  }

  left(int billAmount, int credited) {
    AmountCredited = AmountCredited + credited;
    int leftAmount;
    leftAmount = billAmount - AmountCredited;
    return leftAmount;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Credit"),
          backgroundColor: Colors.pink[900],
        ),
        floatingActionButton: IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => saleCredit(
                          shopId: widget.shopId,
                          billId: widget.billId,
                          place: widget.place,
                        )));
          },
        ),
        body: StreamBuilder(
            stream: particularCreditBill,
            builder: (context, snapshot) {
              return snapshot.data == null
                  ? Loading()
                  : ListView.builder(
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 5.0,
                          margin: EdgeInsets.all(20.0),
                          child: Container(
                            margin: EdgeInsets.all(10.0),
                            height: 150.0,
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
                                            "Credited Amount:",
                                            style: TextStyle(fontSize: 18.0),
                                          ),
                                          Text(
                                            snapshot.data.documents[index]
                                                .data["creditAmount"],
                                            style: TextStyle(fontSize: 27.0),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "Date:",
                                            style: TextStyle(fontSize: 20.0),
                                          ),
                                          Text(
                                            "${snapshot.data.documents[index].data["date"]}",
                                            style: TextStyle(fontSize: 25.0),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    "Left: ${left(int.parse(widget.billAmount), int.parse(snapshot.data.documents[index].data["creditAmount"]))}",
                                    style: TextStyle(fontSize: 25.0),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      IconButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      editSaleCredit(
                                                        shopId: widget.shopId,
                                                        place: widget.place,
                                                        billId: widget.billId,
                                                        id: snapshot
                                                            .data
                                                            .documents[index]
                                                            .data["id"],
                                                        amount:
                                                            snapshot
                                                                    .data
                                                                    .documents[
                                                                        index]
                                                                    .data[
                                                                "creditAmount"],
                                                      )));
                                        },
                                        icon: Icon(Icons.edit),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: Text("Delete"),
                                                  content: Text(
                                                      "You want to delete ${snapshot.data.documents[index].data["creditAmount"]}"),
                                                  actions: <Widget>[
                                                    FlatButton(
                                                      child: Text("No"),
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                    ),
                                                    FlatButton(
                                                      child: Text("Yes"),
                                                      onPressed: () async {
                                                        Navigator.pop(context);
                                                        await database
                                                            .deleteLocalCreditSaleMoney(
                                                          widget.shopId,
                                                          widget.billId,
                                                          snapshot
                                                              .data
                                                              .documents[index]
                                                              .data["id"],
                                                        );
                                                      },
                                                    )
                                                  ],
                                                );
                                              });
                                        },
                                        icon: Icon(Icons.delete),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      });
            }));
  }
}
