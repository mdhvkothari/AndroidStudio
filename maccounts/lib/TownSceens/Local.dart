
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maccounts/Screens/Local/shopBillDetails.dart';
import 'package:maccounts/Screens/loading.dart';
import 'package:maccounts/Services/database.dart';
import 'package:url_launcher/url_launcher.dart';

class Local extends StatefulWidget {
  String place;

  Local({this.place});

  @override
  _LocalState createState() => _LocalState();
}

class _LocalState extends State<Local> {
  Stream localShop;
  Database database = Database();

  @override
  void initState() {
    database.getLocalShop().then((val) {
      setState(() {
        localShop = val;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.place),
        backgroundColor: Colors.pink[900],
      ),
      body: Container(
        child: StreamBuilder(
          stream: localShop,
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
                                  builder: (context) => LocalBills(
                                        shopName: snapshot.data.documents[index]
                                            .data["shopName"],
                                        id: snapshot
                                            .data.documents[index].data["id"],
                                        place: widget.place,
                                      )));
                        },
                        child: Card(
                          elevation: 5.0,
                          margin: EdgeInsets.all(10.0),
                          child: Container(
                            height: 50.0,
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    snapshot
                                        .data.documents[index].data["shopName"],
                                    style: TextStyle(fontSize: 27.0),
                                  ),
                                  IconButton(
                                    onPressed: () async {
                                      await launch(
                                          'tel:+91${snapshot.data.documents[index].data["phone"]}');
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
