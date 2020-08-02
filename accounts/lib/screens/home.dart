import 'package:accounts/Screens/addingShopDetails.dart';
import 'package:accounts/Screens/shopBillDetails.dart';
import 'package:accounts/Service/auth.dart';
import 'package:accounts/Service/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'editInShop.dart';

class home extends StatefulWidget {
  String uid;

  home({this.uid});

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  AuthService _authService = AuthService();
  FirebaseUser user;
  Stream shop;
  Database database = Database();

  @override
  void initState() {
    database.getShops(widget.uid).then((val) {
      setState(() {
        shop = val;
      });
      print(shop);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.exit_to_app,
                color: Colors.white,
              ),
              onPressed: () async {
                await _authService.signOut();
              },
            )
          ],
          title: Text("allShops"),
          backgroundColor: Colors.pink[900],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => shopDetails(
                          uid: widget.uid,
                        )));
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.pink[900],
        ),
        body: Container(
          child: StreamBuilder(
            stream: shop,
            builder: (context, snapshot) {
              return snapshot.data == null
                  ? Container(
                      padding: EdgeInsets.all(20.0),
                      child: Center(
                          child: Text(
                        "No shops added yet to add the shops click on '+' button.",
                        style: TextStyle(fontSize: 20.0, color: Colors.grey),
                      )),
                    )
                  : ListView.builder(
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => shopBillDetails(
                                          uid: widget.uid,
                                          id: snapshot
                                              .data.documents[index].data["id"],
                                          shopName: snapshot
                                              .data
                                              .documents[index]
                                              .data["shopName"],
                                        )));
                          },
                          child: Card(
                              elevation: 10.0,
                              margin: EdgeInsets.all(10.0),
                              child: Container(
                                height: 100.0,
                                child: Center(
                                  child: Column(children: <Widget>[
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                            snapshot.data.documents[index]
                                                .data["shopName"],
                                            style: TextStyle(fontSize: 27.0)),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        IconButton(
                                          onPressed: () async {
                                            await launch(
                                                'tel:+91${snapshot.data.documents[index].data["phone"]}');
                                          },
                                          icon: Icon(Icons.phone),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        editShop(
                                                          shopName: snapshot
                                                              .data
                                                              .documents[index]
                                                              .data["shopName"],
                                                          phone: snapshot
                                                              .data
                                                              .documents[index]
                                                              .data["phone"],
                                                          uid: widget.uid,
                                                          id: snapshot
                                                              .data
                                                              .documents[index]
                                                              .data["id"],
                                                        )));
                                          },
                                          icon: Icon(Icons.edit),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    title: Text(
                                                      "Delete",
                                                      style: TextStyle(
                                                          color: Colors.red),
                                                    ),
                                                    content: Text(
                                                        "You want to delete ${snapshot.data.documents[index].data["shopName"]}"),
                                                    actions: <Widget>[
                                                      FlatButton(
                                                        child: Text("No"),
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                      ),
                                                      FlatButton(
                                                        child: Text("Yes"),
                                                        onPressed: () async {
                                                          Navigator.pop(
                                                              context);
                                                          await database
                                                              .deleteShop(
                                                            widget.uid,
                                                            snapshot
                                                                .data
                                                                .documents[
                                                                    index]
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
                                  ]),
                                ),
                              )),
                        );
                      });
            },
          ),
        ));
  }
}
