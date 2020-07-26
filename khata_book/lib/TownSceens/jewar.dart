import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khata_book/Screens/JewarBills/shopBillDetails.dart';
import 'package:khata_book/Screens/addingShopDetails.dart';
import 'package:khata_book/Screens/editShopData.dart';
import 'package:khata_book/Screens/loading.dart';
import 'package:khata_book/Services/database.dart';
import 'package:url_launcher/url_launcher.dart';

class Jewar extends StatefulWidget {
  String place;

  Jewar({this.place});

  @override
  _JewarState createState() => _JewarState();
}

class _JewarState extends State<Jewar> {
  Stream jewarShop;
  Database database = Database();

  @override
  void initState() {
    database.getJewarShop().then((val) {
      setState(() {
        jewarShop = val;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jewar"),
        backgroundColor: Colors.pink[900],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => shopDetails(widget.place)));
        },
        backgroundColor: Colors.pink[900],
        child: Icon(Icons.add),
      ),
      body: Container(
        child: StreamBuilder(
          stream: jewarShop,
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
                              builder: (context) =>
                                  jewarBills(
                                    shopName: snapshot.data.documents[index]
                                        .data["shopName"],
                                    id: snapshot
                                        .data.documents[index].data["id"],
                                    palce: widget.place,
                                  )));
                    },
                    child: Card(
                      elevation: 5.0,
                      margin: EdgeInsets.all(10.0),
                      child: Container(
                        height: 96.0,
                        child: Center(
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    snapshot.data.documents[index]
                                        .data["shopName"],
                                    style: TextStyle(fontSize: 27.0),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  IconButton(
                                    onPressed: () async {
                                      await launch(
                                          'tel:+91${snapshot.data
                                              .documents[index]
                                              .data["phone"]}');
                                    },
                                    icon: Icon(Icons.phone),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  editShopData(
                                                    shopName: snapshot
                                                        .data
                                                        .documents[index]
                                                        .data["shopName"],
                                                    placeName: widget.place,
                                                    id: snapshot
                                                        .data
                                                        .documents[index]
                                                        .data["id"],
                                                    phoneNumber: snapshot
                                                        .data
                                                        .documents[index]
                                                        .data["phone"],
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
                                              content:
                                              Text(
                                                  "You want to delete ${snapshot
                                                      .data
                                                      .documents[index]
                                                      .data["shopName"]}"),
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
                                                        .deleteJewarShop(
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
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                });
          },
        ),
      ),
    );
  }
}
