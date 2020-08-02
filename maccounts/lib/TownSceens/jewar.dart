
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maccounts/Screens/JewarBills/shopBillDetails.dart';
import 'package:maccounts/Screens/loading.dart';
import 'package:maccounts/Services/database.dart';

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
                        height: 60.0,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                snapshot.data.documents[index]
                                    .data["shopName"],
                                style: TextStyle(fontSize: 27.0),
                              ),

                              IconButton(
                                onPressed: () async {
                                  await launch(
                                      'tel:+91${snapshot.data
                                          .documents[index]
                                          .data["phone"]}');
                                },
                                icon: Icon(Icons.phone),
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
      ),
    );
  }
}
