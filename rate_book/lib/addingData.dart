import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';
import 'package:rate_book/Screens/loading.dart';
import 'package:rate_book/Service/database.dart';

class addingData extends StatefulWidget {
  @override
  _addingDataState createState() => _addingDataState();
}

class _addingDataState extends State<addingData> {
  final _key = GlobalKey<FormState>();
  bool _loading = false;
  String city, item, rate,id,id2;
  DateTime _date = DateTime.now();
  Database database = Database();

  Future<Null> selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime(2019),
        lastDate: DateTime(2021));
    setState(() {
      _date = picked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[900],
        title: Text(
          "addingRate",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: _loading
          ? Loading()
          : SingleChildScrollView(
              child: Container(
                child: Form(
                  key: _key,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            'City : ',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          DropdownButton<String>(
                            style: TextStyle(fontSize: 25, color: Colors.black),
                            value: city,
                            onChanged: (String val) {
                              setState(() {
                                city = val;
                              });
                            },
                            items: <String>['Bharatpur', 'Jaipur']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            'Item : ',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          DropdownButton<String>(
                            style: TextStyle(fontSize: 25, color: Colors.black),
                            value: item,
                            onChanged: (String val) {
                              setState(() {
                                item = val;
                              });
                            },
                            items: <String>['Mustard', 'Soya']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              Icons.calendar_today,
                            ),
                            onPressed: () {
                              selectDate(context);
                            },
                            iconSize: 30.0,
                          ),
                          SizedBox(width: 20.0),
                          Text(
                            "$_date" != null
                                ? "${_date.day}-${_date.month}-${_date.year}"
                                : "SELECT DATE",
                            style: TextStyle(fontSize: 25.0),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(50.0),
                        child: TextFormField(
                          validator: (val) =>
                              val.isEmpty ? "Enter Your Rate" : null,
                          decoration: InputDecoration(
                            hintText: "Rate",
                          ),
                          onChanged: (val) {
                            rate = val;
                          },
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      RaisedButton(
                        onPressed: () async {
                          if (_key.currentState.validate()) {
                            setState(() {
                              _loading = true;
                            });
                            id = randomAlpha(18);
                            id2 = randomAlpha(18);
                            Map<String, dynamic> addingDataToMap = {
                              "rate": rate,
                              "date":
                                  "${_date.day}-${_date.month}-${_date.year}",
                              "id":id2,
                            };
                            await database
                                .addingData(city, item, addingDataToMap,
                                    id,id2)
                                .then((value) {
                              setState(() {
                                _loading = false;
                              });
                              Navigator.pop(context);
                            });
                          }
                        },
                        child: Text("SAVE"),
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
