import 'package:flutter/material.dart';
import 'package:khata_book/Screens/loading.dart';
import 'package:khata_book/Services/database.dart';

import '../addCreditTaxBill.dart';
import '../editTaxBillCredit.dart';

class particularTaxBill extends StatefulWidget {
  String billId, shopId, place;

  particularTaxBill({this.billId, this.shopId, this.place});

  @override
  _particularTaxBillState createState() => _particularTaxBillState();
}

class _particularTaxBillState extends State<particularTaxBill> {
  Stream particularCreditBill;
  String totalCreditedAmount;
  Database database = Database();

  @override
  void initState() {
    database
        .getLocalParticularTaxBillCredit(widget.shopId, widget.billId)
        .then((val) {
      setState(() {
        particularCreditBill = val;
      });
    });
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
                    builder: (context) => taxCredit(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        "Credited Amount :",
                                        style: TextStyle(fontSize: 20.0),
                                      ),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Text(
                                        snapshot.data.documents[index]
                                            .data["creditAmount"],
                                        style: TextStyle(fontSize: 27.0),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        "Cheque Number :",
                                        style: TextStyle(fontSize: 20.0),
                                      ),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Text(
                                        snapshot.data.documents[index]
                                            .data["chequeNumber"],
                                        style: TextStyle(fontSize: 27.0),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        "Bank :",
                                        style: TextStyle(fontSize: 20.0),
                                      ),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Text(
                                        snapshot
                                            .data.documents[index].data["bank"],
                                        style: TextStyle(fontSize: 27.0),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        "Date :",
                                        style: TextStyle(fontSize: 20.0),
                                      ),
                                      Text(
                                        "${snapshot.data.documents[index].data["date"]}",
                                        style: TextStyle(fontSize: 25.0),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      editTaxBillCredit(
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
                                                        chequeNumber:
                                                            snapshot
                                                                    .data
                                                                    .documents[
                                                                        index]
                                                                    .data[
                                                                "chequeNumber"],
                                                        bank: snapshot
                                                            .data
                                                            .documents[index]
                                                            .data["bank"],
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
                                                            .deleteLocalCreditTaxMoney(
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
