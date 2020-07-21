import 'package:detail_book/particularData.dart';
import 'package:flutter/material.dart';

import 'database/database.dart';
import 'loading.dart';

class allList extends StatefulWidget {
  @override
  _allListState createState() => _allListState();
}

class _allListState extends State<allList> {
  Stream allData;
  Database database = Database();

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
        child: Container(
            child: StreamBuilder(
      stream: allData,
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
                              builder: (context) => particularData(
                                  snapshot.data.documents[index].data["id"])));
                    },
                    child: Card(
                      elevation: 5.0,
                      margin: EdgeInsets.all(10.0),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Shop name:",
                                style: TextStyle(fontSize: 20.0),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                  '${snapshot.data.documents[index].data["shopName"]}',
                                  style: TextStyle(fontSize: 20.0)),
                            ],
                          ),
                          SizedBox(
                            height: 10.0,
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
                                '${snapshot.data.documents[index].data["town"]}',
                                style: TextStyle(fontSize: 20.0),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                              '${snapshot.data.documents[index].data["date"]}'),
                        ],
                      ),
                    ),
                  );
                });
      },
    )));
  }
}
