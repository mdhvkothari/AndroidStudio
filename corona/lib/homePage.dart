import 'dart:async';
import 'dart:convert';
import 'package:corona/card.dart';
import 'package:corona/solution.dart';
import 'package:corona/world.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shimmer/shimmer.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map data;
  Map world;

  Future<bool> _getDate() async {
    var datas = await http.get("https://api.covid19api.com/summary");
    data = json.decode(datas.body);
    setState(() {
      world = data["Global"];
    });
  }

  void initState() {
    _getDate();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Corona'),
          backgroundColor: Colors.pink[900],
          actions: <Widget>[
            FlatButton.icon(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => World(world:world))),
              icon: Icon(
                Icons.language,
                color: Colors.white,
              ),
              label: Text(
                'Global',
                style: TextStyle(color: Colors.white),
              ),
            ),
            FlatButton.icon(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => Solution())),
              icon: Icon(
                Icons.info,
                color: Colors.white,
              ),
              label: Text(
                'Info',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        body: DelayedList());
  }
}

class DelayedList extends StatefulWidget {
  @override
  _DelayedListState createState() => _DelayedListState();
}

class _DelayedListState extends State<DelayedList> {
  Map data;
  List detailData;
  Map world;

  Future<bool> _getDate() async {
    var datas = await http.get("https://api.covid19api.com/summary");
    data = json.decode(datas.body);
    setState(() {
      detailData = data["Countries"];
      world = data["Global"];
    });
  }

  void initState() {
    _getDate();
  }

  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    Timer timer = Timer(Duration(seconds: 5), () {
      setState(() {
        isLoading = false;
      });
    });

    return isLoading
        ? ShimmerList()
        : cardData(detailData: detailData, timer: timer);
  }
}

class ShimmerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Shimmer.fromColors(
        baseColor: Colors.grey[400],
        highlightColor: Colors.grey[100],
        child: ListView.builder(
          itemCount: 6,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              margin: EdgeInsets.all(5.0),
              elevation: 10.0,
              child: Container(
                height: 150,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 10.0,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
