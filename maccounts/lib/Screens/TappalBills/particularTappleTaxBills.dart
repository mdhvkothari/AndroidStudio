import 'package:flutter/material.dart';
import 'package:maccounts/Services/database.dart';
import '../loading.dart';

class particularTaxBillTappal extends StatefulWidget {
  String billId, shopId, place;

  particularTaxBillTappal({this.billId, this.shopId, this.place});

  @override
  _particularTaxBillTappalState createState() =>
      _particularTaxBillTappalState();
}

class _particularTaxBillTappalState extends State<particularTaxBillTappal> {
  Stream particularCreditBill;
  String totalCreditedAmount;
  Database database = Database();

  @override
  void initState() {
    database
        .getTappalParticularTaxBillCredit(widget.shopId, widget.billId)
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
                            height: 140.0,
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
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Text(
                                        "${snapshot.data.documents[index].data["date"]}",
                                        style: TextStyle(fontSize: 25.0),
                                      ),
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
