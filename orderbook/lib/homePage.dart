import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:orderbook/databse/database.dart';
import 'package:orderbook/loading.dart';
import 'package:random_string/random_string.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Database database = Database();
  GlobalKey<FormState> _key = GlobalKey();
  static var dt = DateTime.now();
  var newDt = DateFormat.yMMMEd().format(dt);
  bool isLoading = false;
  String name,
      town,
      pp1kg,
      pp500,
      pp250,
      pp100,
      pp50,
      tata10,
      tata5,
      jar1,
      jar500,
      jar250,
      e250,
      e20,
      e10,
      e5,
      a250,
      a20,
      a10,
      a5,
      tatasalt,
      ishakti,
      id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.pink[900],
      appBar: AppBar(
        elevation: 0.0,
        title: Text('orderBook'),
        backgroundColor: Colors.pink[900],
      ),
      body: isLoading
          ?Loading()
          : Form(key: _key, child: getDetails()),
    );
  }

  Widget getDetails() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(100)),
          ),
          child: Column(
            children: <Widget>[
              Center(
                  child: (Text(
                ''' Maheshwari Brother's  ''',
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 25.0),
              ))),
              SizedBox(
                height: 80.0,
              ),
              TextFormField(
                validator: (val) => val.isEmpty ? 'Enter Shop name' : null,
                decoration: InputDecoration(hintText: 'Shop name'),
                maxLength: 32,
                onChanged: (val) {
                  name = val;
                },
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 90.0,
                  ),
                  Text(
                    'Town : ',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  DropdownButton<String>(
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    value: town,
                    onChanged: (String val) {
                      setState(() {
                        town = val;
                      });
                    },
                    items: <String>['Jewar ', 'Tappal ', 'Jahangipur ']
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
              Center(
                  child: Text(
                'TATA TEA',
                style: TextStyle(fontSize: 25),
              )),
              SizedBox(
                height: 30.0,
              ),
              Row(
                children: <Widget>[
                  Text(
                    "PP 1kg :",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(hintText: 'Enter Amount'),
                      maxLength: 3,
                      keyboardType: TextInputType.number,
                      onChanged: (val) {
                        pp1kg = val;
                      },
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Row(
                children: <Widget>[
                  Text(
                    "PP 500gm :",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(hintText: 'Enter Amount'),
                      maxLength: 3,
                      keyboardType: TextInputType.number,
                      onChanged: (val) {
                        pp500 = val;
                      },
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: <Widget>[
                  Text(
                    "PP 250gm :",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(hintText: 'Enter Amount'),
                      maxLength: 3,
                      keyboardType: TextInputType.number,
                      onChanged: (val) {
                        pp250 = val;
                      },
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: <Widget>[
                  Text(
                    "PP 100gm :",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(hintText: 'Enter Amount'),
                      maxLength: 3,
                      keyboardType: TextInputType.number,
                      onChanged: (val) {
                        pp100 = val;
                      },
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Row(
                children: <Widget>[
                  Text(
                    "PP 50gm :",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(hintText: 'Enter Amount'),
                      maxLength: 3,
                      keyboardType: TextInputType.number,
                      onChanged: (val) {
                        pp50 = val;
                      },
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Row(
                children: <Widget>[
                  Text(
                    "Tata 10rs :",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration:
                          InputDecoration(hintText: 'Number of Packets'),
                      maxLength: 3,
                      keyboardType: TextInputType.number,
                      onChanged: (val) {
                        tata10 = val;
                      },
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Row(
                children: <Widget>[
                  Text(
                    "Tata 5rs :",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration:
                          InputDecoration(hintText: 'Number of Packets'),
                      maxLength: 3,
                      keyboardType: TextInputType.number,
                      onChanged: (val) {
                        tata5 = val;
                      },
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Row(
                children: <Widget>[
                  Text(
                    "Jar 1kg :",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(hintText: 'Enter Amount'),
                      maxLength: 3,
                      keyboardType: TextInputType.number,
                      onChanged: (val) {
                        jar1 = val;
                      },
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Row(
                children: <Widget>[
                  Text(
                    "Jar 500gm :",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(hintText: 'Enter Amount'),
                      maxLength: 3,
                      keyboardType: TextInputType.number,
                      onChanged: (val) {
                        jar500 = val;
                      },
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Row(
                children: <Widget>[
                  Text(
                    "Jar 250gm :",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(hintText: 'Enter Amount'),
                      maxLength: 3,
                      keyboardType: TextInputType.number,
                      onChanged: (val) {
                        jar250 = val;
                      },
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Row(
                children: <Widget>[
                  Text(
                    "Elachi 250gm :",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(hintText: 'Enter Amount'),
                      maxLength: 3,
                      keyboardType: TextInputType.number,
                      onChanged: (val) {
                        e250 = val;
                      },
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Row(
                children: <Widget>[
                  Text(
                    "Elachi 20rs :",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration:
                          InputDecoration(hintText: 'Number of Packets'),
                      maxLength: 3,
                      keyboardType: TextInputType.number,
                      onChanged: (val) {
                        e20 = val;
                      },
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Row(
                children: <Widget>[
                  Text(
                    "Elachi 10rs :",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration:
                          InputDecoration(hintText: 'Number of Packets'),
                      maxLength: 3,
                      keyboardType: TextInputType.number,
                      onChanged: (val) {
                        e10 = val;
                      },
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Row(
                children: <Widget>[
                  Text(
                    "Elachi 5rs :",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration:
                          InputDecoration(hintText: 'Number of Packets'),
                      maxLength: 3,
                      keyboardType: TextInputType.number,
                      onChanged: (val) {
                        e5 = val;
                      },
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Row(
                children: <Widget>[
                  Text(
                    "Agni 250gm :",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(hintText: 'Enter Amount'),
                      maxLength: 3,
                      keyboardType: TextInputType.number,
                      onChanged: (val) {
                        a250 = val;
                      },
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Row(
                children: <Widget>[
                  Text(
                    "Agni 20rs :",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration:
                          InputDecoration(hintText: 'Number of Packets'),
                      maxLength: 3,
                      keyboardType: TextInputType.number,
                      onChanged: (val) {
                        a20 = val;
                      },
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Row(
                children: <Widget>[
                  Text(
                    "Agni 10rs :",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration:
                          InputDecoration(hintText: 'Number of Packets'),
                      maxLength: 3,
                      keyboardType: TextInputType.number,
                      onChanged: (val) {
                        a10 = val;
                      },
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Row(
                children: <Widget>[
                  Text(
                    "Agni 5rs :",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration:
                          InputDecoration(hintText: 'Number of Packets'),
                      maxLength: 3,
                      keyboardType: TextInputType.number,
                      onChanged: (val) {
                        a5 = val;
                      },
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Center(
                  child: Text(
                'TATA SALT',
                style: TextStyle(fontSize: 25),
              )),
              SizedBox(
                height: 30.0,
              ),
              Row(
                children: <Widget>[
                  Text(
                    "Tata Salt :",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(hintText: 'Number of Bags'),
                      maxLength: 2,
                      keyboardType: TextInputType.number,
                      onChanged: (val) {
                        tatasalt = val;
                      },
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: <Widget>[
                  Text(
                    "I-Shakti :",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(hintText: 'Number of Bags'),
                      maxLength: 2,
                      keyboardType: TextInputType.number,
                      onChanged: (val) {
                        ishakti = val;
                      },
                    ),
                  )
                ],
              ),
              RaisedButton(
                onPressed: () async {
                  if (_key.currentState.validate()) {
                    setState(() {
                      isLoading = true;
                    });
                    id =randomAlpha(16);
                    Map<String, dynamic> orderData = {
                      "shopName": name,
                      "town": town,
                      "pp1kg": pp1kg,
                      "pp500": pp500,
                      "pp250": pp250,
                      "pp100": pp100,
                      "pp50": pp50,
                      "tata10": tata10,
                      "tata5": tata5,
                      "jar1": jar1,
                      "jar500": jar500,
                      "jar250": jar250,
                      "e250": e250,
                      "e20": e20,
                      "e10": e10,
                      "e5": e5,
                      "a250": a250,
                      "a20": a20,
                      "a10": a10,
                      "a5": a5,
                      "tataSalt": tatasalt,
                      "Ishakti": ishakti,
                      "date": newDt,
                      "id":id,
                    };
                    await database.addData(orderData,id);
                    setState(() {
                      isLoading = false;
                    });
                  }
                },
                child: Text('Place Your Order!!'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
