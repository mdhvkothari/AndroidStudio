
import 'package:flutter/material.dart';
import 'package:maccounts/Screens/Local/particularSaleBillCredit.dart';
import 'package:maccounts/Services/database.dart';
import '../loading.dart';

class localSale extends StatefulWidget {
  String shopId,place;

  localSale({this.shopId,this.place});

  @override
  _localSaleState createState() => _localSaleState();
}

class _localSaleState extends State<localSale> {
  Stream saleBills;
  Database database = Database();

  @override
  void initState() {
    database.getLocalSaleBill(widget.shopId).then((val) {
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
                            builder: (context) => particularSaleBill(
                              billId: snapshot
                                  .data.documents[index].data["id"],
                              shopId: widget.shopId,
                              billAmount: snapshot.data.documents[index]
                                  .data["billAmount"],place: widget.place,
                            )));
                  },
                  child: Card(
                    elevation: 5.0,
                    margin: EdgeInsets.all(10.0),
                    child: Container(
                      margin: EdgeInsets.all(10.0),
                      height: 100.0,
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                            SizedBox(height: 10.0,),
                            Text(
                              snapshot.data.documents[index]
                                  .data["comment"],
                              style: TextStyle(fontSize: 20.0),
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
