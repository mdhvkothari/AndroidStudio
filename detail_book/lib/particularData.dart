import 'package:detail_book/database/database.dart';
import 'package:detail_book/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class particularData extends StatefulWidget {
  String id;

  particularData(this.id);

  @override
  _particularDataState createState() => _particularDataState();
}

class _particularDataState extends State<particularData> {
  Stream particularData;
  Database database = Database();

  @override
  void initState() {
    database.getAllData().then((val) {
      setState(() {
        print(val);
        particularData = val;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order'),
        backgroundColor: Colors.pink[900],
      ),
      body: Container(
          child: StreamBuilder(
        stream: particularData,
        builder: (context, snapshot) {
          return snapshot.data == null
              ? Loading()
              : ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    return snapshot.data.documents[index].data["id"] ==
                            widget.id
                        ? Card(
                            margin: EdgeInsets.all(10.0),
                            elevation: 10.0,
                            child: Column(
                              children: <Widget>[
                                SizedBox(height: 5.0),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "Shop Name:",
                                      style: TextStyle(fontSize: 20.0),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Text(
                                        snapshot.data.documents[index]
                                            .data["shopName"],
                                        style: TextStyle(fontSize: 20.0)),
                                  ],
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "Town:",
                                      style: TextStyle(fontSize: 20.0),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Text(
                                        snapshot
                                            .data.documents[index].data["town"],
                                        style: TextStyle(fontSize: 20.0)),
                                  ],
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "PP 1Kg:",
                                      style: TextStyle(fontSize: 20.0),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Text(
                                        snapshot.data.documents[index]
                                                    .data["pp1kg"] ==
                                                null
                                            ? "0"
                                            : snapshot.data.documents[index]
                                                .data["pp1kg"],
                                        style: TextStyle(fontSize: 20.0)),
                                  ],
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "PP 500Kg:",
                                      style: TextStyle(fontSize: 20.0),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Text(
                                        snapshot.data.documents[index]
                                                    .data["pp500"] ==
                                                null
                                            ? "0"
                                            : snapshot.data.documents[index]
                                                .data["pp500"],
                                        style: TextStyle(fontSize: 20.0)),
                                  ],
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "PP 250gm:",
                                      style: TextStyle(fontSize: 20.0),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Text(
                                        snapshot.data.documents[index]
                                                    .data["pp250"] ==
                                                null
                                            ? "0"
                                            : snapshot.data.documents[index]
                                                .data["pp250"],
                                        style: TextStyle(fontSize: 20.0)),
                                  ],
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "PP 100gm:",
                                      style: TextStyle(fontSize: 20.0),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Text(
                                        snapshot.data.documents[index]
                                                    .data["pp100"] ==
                                                null
                                            ? "0"
                                            : snapshot.data.documents[index]
                                                .data["pp100"],
                                        style: TextStyle(fontSize: 20.0)),
                                  ],
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "PP 50gm:",
                                      style: TextStyle(fontSize: 20.0),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Text(
                                        snapshot.data.documents[index]
                                                    .data["pp50"] ==
                                                null
                                            ? "0"
                                            : snapshot.data.documents[index]
                                                .data["pp50"],
                                        style: TextStyle(fontSize: 20.0)),
                                  ],
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "Tata 10rs:",
                                      style: TextStyle(fontSize: 20.0),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Text(
                                        snapshot.data.documents[index]
                                                    .data["tata10"] ==
                                                null
                                            ? "0"
                                            : snapshot.data.documents[index]
                                                .data["tata10"],
                                        style: TextStyle(fontSize: 20.0)),
                                  ],
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "Tata 5rs:",
                                      style: TextStyle(fontSize: 20.0),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Text(
                                        snapshot.data.documents[index]
                                                    .data["tata5"] ==
                                                null
                                            ? "0"
                                            : snapshot.data.documents[index]
                                                .data["tata5"],
                                        style: TextStyle(fontSize: 20.0)),
                                  ],
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "Jar 1Kg:",
                                      style: TextStyle(fontSize: 20.0),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Text(
                                        snapshot.data.documents[index]
                                                    .data["jar1"] ==
                                                null
                                            ? "0"
                                            : snapshot.data.documents[index]
                                                .data["jar1"],
                                        style: TextStyle(fontSize: 20.0)),
                                  ],
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "Jar 500Kg:",
                                      style: TextStyle(fontSize: 20.0),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Text(
                                        snapshot.data.documents[index]
                                                    .data["jar500"] ==
                                                null
                                            ? "0"
                                            : snapshot.data.documents[index]
                                                .data["jar500"],
                                        style: TextStyle(fontSize: 20.0)),
                                  ],
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "Jar 250gm:",
                                      style: TextStyle(fontSize: 20.0),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Text(
                                        snapshot.data.documents[index]
                                                    .data["jar250"] ==
                                                null
                                            ? "0"
                                            : snapshot.data.documents[index]
                                                .data["jar250"],
                                        style: TextStyle(fontSize: 20.0)),
                                  ],
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "Elaichi 250gm:",
                                      style: TextStyle(fontSize: 20.0),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Text(
                                        snapshot.data.documents[index]
                                                    .data["e250"] ==
                                                null
                                            ? "0"
                                            : snapshot.data.documents[index]
                                                .data["e250"],
                                        style: TextStyle(fontSize: 20.0)),
                                  ],
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "Elaichi 20rs:",
                                      style: TextStyle(fontSize: 20.0),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Text(
                                        snapshot.data.documents[index]
                                                    .data["e20"] ==
                                                null
                                            ? "0"
                                            : snapshot.data.documents[index]
                                                .data["e20"],
                                        style: TextStyle(fontSize: 20.0)),
                                  ],
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "Elaichi 10r:",
                                      style: TextStyle(fontSize: 20.0),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Text(
                                        snapshot.data.documents[index]
                                            .data["e10"] ==
                                            null
                                            ? "0"
                                            : snapshot.data.documents[index]
                                            .data["e10"],
                                        style: TextStyle(fontSize: 20.0)),
                                  ],
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "Elaichi 5rs:",
                                      style: TextStyle(fontSize: 20.0),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Text(
                                        snapshot.data.documents[index]
                                            .data["e5"] ==
                                            null
                                            ? "0"
                                            : snapshot.data.documents[index]
                                            .data["e5"],
                                        style: TextStyle(fontSize: 20.0)),
                                  ],
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "Agni 250gm:",
                                      style: TextStyle(fontSize: 20.0),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Text(
                                        snapshot.data.documents[index]
                                            .data["a250"] ==
                                            null
                                            ? "0"
                                            : snapshot.data.documents[index]
                                            .data["a250"],
                                        style: TextStyle(fontSize: 20.0)),
                                  ],
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "Agni 20rs:",
                                      style: TextStyle(fontSize: 20.0),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Text(
                                        snapshot.data.documents[index]
                                            .data["a20"] ==
                                            null
                                            ? "0"
                                            : snapshot.data.documents[index]
                                            .data["a20"],
                                        style: TextStyle(fontSize: 20.0)),
                                  ],
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "Agni 10rs:",
                                      style: TextStyle(fontSize: 20.0),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Text(
                                        snapshot.data.documents[index]
                                            .data["a10"] ==
                                            null
                                            ? "0"
                                            : snapshot.data.documents[index]
                                            .data["a10"],
                                        style: TextStyle(fontSize: 20.0)),
                                  ],
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "Agni 5rs:",
                                      style: TextStyle(fontSize: 20.0),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Text(
                                        snapshot.data.documents[index]
                                            .data["a5"] ==
                                            null
                                            ? "0"
                                            : snapshot.data.documents[index]
                                            .data["a5"],
                                        style: TextStyle(fontSize: 20.0)),
                                  ],
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "Tata Salt:",
                                      style: TextStyle(fontSize: 20.0),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Text(
                                        snapshot.data.documents[index]
                                            .data["tataSalt"] ==
                                            null
                                            ? "0"
                                            : snapshot.data.documents[index]
                                            .data["tataSalt"],
                                        style: TextStyle(fontSize: 20.0)),
                                  ],
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "I-Shakti",
                                      style: TextStyle(fontSize: 20.0),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Text(
                                        snapshot.data.documents[index]
                                            .data["Ishakti"] ==
                                            null
                                            ? "0"
                                            : snapshot.data.documents[index]
                                            .data["Ishakti"],
                                        style: TextStyle(fontSize: 20.0)),
                                  ],
                                ),
                              ],
                            ),
                          )
                        : Container();
                  });
        },
      )),
    );
  }
}
