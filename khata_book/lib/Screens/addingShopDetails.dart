import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khata_book/Screens/loading.dart';
import 'package:khata_book/Services/database.dart';
import 'package:khata_book/TownSceens/Local.dart';
import 'package:khata_book/TownSceens/Tappal.dart';
import 'package:khata_book/TownSceens/jewar.dart';
import 'package:random_string/random_string.dart';

class shopDetails extends StatefulWidget {
  String placeName;

  shopDetails(this.placeName);

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
          ? Loading()
          : Container(
              child: Form(
                key: _key,
                child: Container(
                  padding: EdgeInsets.all(30.0),
                  child: Column(
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
                        height: 20.0,
                      ),
                      TextFormField(
                        decoration:
                            InputDecoration(hintText: 'Enter shopPhoneNumber'),
                        validator: (val) =>
                            val.isEmpty ? "Enter shop phone Number" : null,
                        onChanged: (val) {
                          setState(() {
                            shopNumber = val;
                          });
                        },
                        keyboardType: TextInputType.number,
                      ),
                      Spacer(),
                      RaisedButton(
                        onPressed: () async {
                          if (_key.currentState.validate()) {
                            setState(() {
                              _isLoading = true;
                            });
                            id = randomAlpha(16);
                            Map<String, String> shopMap = {
                              "shopName": shopName,
                              "id": id,
                              "phone": shopNumber,
                            };
                            if (widget.placeName == "Jewar") {
                              await database
                                  .addJewarShop(shopMap, id)
                                  .then((val) {
                                setState(() {
                                  _isLoading = false;
                                  Navigator.pop(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Jewar()));
                                });
                              });
                            }
                            if (widget.placeName == "Tappal") {
                              await database
                                  .addTappalShop(shopMap, id)
                                  .then((val) {
                                setState(() {
                                  _isLoading = false;
                                  Navigator.pop(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Tappal()));
                                });
                              });
                            }
                            if (widget.placeName == "Local") {
                              await database
                                  .addLocalShop(shopMap, id)
                                  .then((val) {
                                setState(() {
                                  _isLoading = false;
                                  Navigator.pop(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Local()));
                                });
                              });
                            }
                            if (widget.placeName == "Jhangirpur") {
                              await database
                                  .addJhangirpurShop(shopMap, id)
                                  .then((val) {
                                setState(() {
                                  _isLoading = false;
                                  Navigator.pop(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Local()));
                                });
                              });
                            }
                          }
                        },
                        child: Text("ADD"),
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
