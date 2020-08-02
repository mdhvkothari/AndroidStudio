import 'package:accounts/Service/database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

import 'loading.dart';

class shopDetails extends StatefulWidget {
  String uid;

  shopDetails({this.uid});

  @override
  _shopDetailsState createState() => _shopDetailsState();
}

class _shopDetailsState extends State<shopDetails> {
  String shopName, id, shopNumber;
  bool _isLoading = false;
  Database database = Database();
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("addShop"),
        backgroundColor: Colors.pink[900],
      ),
      body: _isLoading
          ? Loading(dotColor: Colors.pink[900],)
          : Container(
              child: Form(
                key: _key,
                child: Container(
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(hintText: 'Enter shopName'),
                        validator: (val) =>
                            val.isEmpty ? "Enter shopName first" : null,
                        onChanged: (val) {
                          setState(() {
                            shopName = val;
                          });
                        },
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      TextFormField(
                        decoration:
                            InputDecoration(hintText: 'Enter shopPhoneNumber'),
                        validator: (val) => val.length != 10
                            ? "Enter shop phoneNumber or Check phoneNumber"
                            : null,
                        onChanged: (val) {
                          setState(() {
                            shopNumber = val;
                          });
                        },
                        keyboardType: TextInputType.number,
                      ),
                      Spacer(),
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(18.0)),
                        onPressed: () async {
                          if (_key.currentState.validate()) {
                            setState(() {
                              _isLoading = true;
                            });
                            id = randomString(18);
                            Map<String, String> shopMap = {
                              "shopName": shopName,
                              "phone": shopNumber,
                              "id": id,
                            };

                            await database
                                .addShop(shopMap, widget.uid, id)
                                .then((val) {
                              setState(() {
                                _isLoading = false;
                                Navigator.pop(context);
                              });
                            });
                          }
                        },
                        color: Colors.pink[900],
                        child: Text("ADD",style: TextStyle(color: Colors.white),),
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
