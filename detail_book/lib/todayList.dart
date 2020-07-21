import 'package:detail_book/database/database.dart';
import 'package:detail_book/loading.dart';
import 'package:detail_book/particularData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class todayList extends StatefulWidget {
  @override
  _todayListState createState() => _todayListState();
}

class _todayListState extends State<todayList> {
  Stream allData;
  Database database = Database();
  static var dt = DateTime.now();
  var newDt = DateFormat.yMMMEd().format(dt);

  @override
  void initState() {
    database.getAllData().then((val) {
      setState(() {
        print(val);
        allData = val;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(
        stream: allData,
        builder: (context, snapshot) {
          return snapshot.data == null
              ? Loading()
              : ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    return newDt != snapshot.data.documents[index].data["date"]
                        ? Container(
                            height: 500.0,
                            child: Center(
                                child: Text(
                              "No Order for Today",
                              style: TextStyle(fontSize: 30.0),
                            )),
                          )
                        : GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => particularData(
                                          snapshot.data.documents[index]
                                              .data["id"])));
                            },
                            child: Card(
                              elevation: 5.0,
                              margin: EdgeInsets.all(10.0),
                              child: Column(
                                children: <Widget>[
                                  SizedBox(height: 10.0,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text("Shop name:",style: TextStyle(fontSize: 20.0),),
                                      SizedBox(width: 10.0,),
                                      Text(
                                          '${snapshot.data.documents[index].data["shopName"]}',style: TextStyle(fontSize: 20.0)),
                                    ],
                                  ),
                                  SizedBox(height: 10.0,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text("Town:",style: TextStyle(fontSize: 20.0),),
                                      SizedBox(width: 10.0,),
                                      Text(
                                          '${snapshot.data.documents[index].data["town"]}',style: TextStyle(fontSize: 20.0),),
                                    ],
                                  ),
                                  SizedBox(height: 10.0,),
                                  Text(
                                      '${snapshot.data.documents[index].data["date"]}'),

                                ],
                              ),
                            ),
                          );
                  });
        },
      ),
    );
  }
}
