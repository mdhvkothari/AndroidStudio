import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class userPage extends StatefulWidget {
  int id;

  userPage({this.id});

  @override
  _userPageState createState() => _userPageState();
}

class _userPageState extends State<userPage> {
  String person_full_name;
  String person_gender;
  String person_age;
  String person_phone;
  String person_address;
  String person_pic;

  FetchData() async {
    var response = await http
        .get("https://dev.uneva.in/task_721/patient.php?id=${widget.id}");
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      setState(() {
        person_full_name = data['person_full_name'];
        person_gender = data['person_gender'];
        person_age = data['person_age'];
        person_phone = data['person_phone'];
        person_address = data['person_address'];
        person_pic = data['person_pic'];
      });
    } else {
      print("Something went wrong");
    }
  }

  @override
  void initState() {
    FetchData();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        title: Text('$person_full_name'),
        actions: <Widget>[
          Icon(Icons.edit),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            height: 30.0,
          ),
          CircleAvatar(
            radius: 60.0,
            backgroundImage: NetworkImage('$person_pic'),
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            children: <Widget>[
              Text(
                "PID",
                style: TextStyle(
                  fontSize: 25.0,
                ),
              ),
              SizedBox(
                width: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: Text(
                  widget.id.toString(),
                  style: TextStyle(
                    fontSize: 25.0,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Text(
                "Name",
                style: TextStyle(
                  fontSize: 25.0,
                ),
              ),
              SizedBox(
                width: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  '$person_full_name',
                  style: TextStyle(
                    fontSize: 25.0,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Text(
                "Gender",
                style: TextStyle(
                  fontSize: 25.0,
                ),
              ),
              SizedBox(
                width: 20.0,
              ),
              Text(
                '$person_gender',
                style: TextStyle(
                  fontSize: 25.0,
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Text(
                "Age",
                style: TextStyle(
                  fontSize: 25.0,
                ),
              ),
              SizedBox(
                width: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 35.0),
                child: Text(
                  '$person_age',
                  style: TextStyle(
                    fontSize: 25.0,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Text(
                "Phone",
                style: TextStyle(
                  fontSize: 25.0,
                ),
              ),
              SizedBox(
                width: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  '$person_phone',
                  style: TextStyle(
                    fontSize: 25.0,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Text(
                "Address",
                style: TextStyle(
                  fontSize: 25.0,
                ),
              ),
              SizedBox(
                width: 20.0,
              ),
              Text('$person_address'),
            ],
          )
        ],
      ),
    );
  }
}
