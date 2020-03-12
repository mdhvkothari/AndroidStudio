import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:unevra/userPage.dart';

void main() => runApp(Myapp());

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

Future<List<UserData>> _getUserData() async {
  final response = await http.get("https://dev.uneva.in/task_721/list.php");
  var jsonData = json.decode(response.body);
  List<UserData> users = [];
  for (var i in jsonData) {
    UserData user = UserData(i["other"]["pid"], i["name"], i["description"],
        i["status"], i["tokenName"], i["tokenNumber"], i['createdAt']);
    users.add(user);
  }
  users.sort((a, b) => a.tokenNumber.compareTo(b.tokenNumber));

  return users;
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        title: Text("ECHO-All"),
      ),
      body: Container(
        child: FutureBuilder(
          future: _getUserData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(
                child: Center(
                  child: Text("Waiting for data...."),
                ),
              );
            } else {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    Color getColor() {
                      if (snapshot.data[index].status == 1) {
                        return Colors.green;
                      } else {
                        return Colors.red;
                      }
                    }

                    String date() {
                      List date = snapshot.data[index].createdAt.split('T');
                      List format = date[0].split('-');
                      if (format[1] == '02') {
                        return format[2] + '-' + 'feb';
                      }
                    }

                    return Container(
                      height: 100,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      userPage(id: snapshot.data[index].pid)));
                        },
                        child: Card(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Text(
                                "${snapshot.data[index].tokenName}",
                                style:
                                    TextStyle(fontSize: 40, color: Colors.red),
                              ),
                              SizedBox(
                                width: 20.0,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    snapshot.data[index].name,
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        snapshot.data[index].description,
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      Text(
                                        date(),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.more_vert,
                                    color: Colors.grey,
                                    size: 35.0,
                                  ),
                                  Container(
                                    height: 20.0,
                                    width: 20.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: getColor(),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            }
          },
        ),
      ),
    );
  }
}

class UserData {
  final int pid;
  final String name;
  final String description;
  final int status;
  final String tokenName;
  final int tokenNumber;
  final String createdAt;

  UserData(this.pid, this.name, this.description, this.status, this.tokenName,
      this.tokenNumber, this.createdAt);
}
