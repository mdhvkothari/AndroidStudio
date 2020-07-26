import 'package:flutter/material.dart';
import 'package:khata_book/Services/database.dart';
import 'package:khata_book/TownSceens/Jhangirpur.dart';
import 'package:khata_book/TownSceens/Local.dart';
import 'package:khata_book/TownSceens/Tappal.dart';
import 'package:khata_book/TownSceens/jewar.dart';


import 'loading.dart';

class editShopData extends StatefulWidget {
  String placeName,shopName,id,phoneNumber;
  editShopData({this.placeName,this.shopName,this.id,this.phoneNumber});
  @override
  _editShopDataState createState() => _editShopDataState();
}

class _editShopDataState extends State<editShopData> {
  String shopName,shopNumber;
  bool _isLoading = false;
  Database database = Database();
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit in ${widget.shopName}"),
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
                  initialValue: widget.shopName,
                  decoration: InputDecoration(hintText: 'Enter shopName'),
                  validator: (val) =>
                  val.isEmpty ? "Enter shopName first" :null,
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
                  initialValue: widget.phoneNumber,
                  decoration:
                  InputDecoration(hintText: 'Enter shopPhoneNumber'),
                  validator: (val) =>
                  val.isEmpty || val.length<10 ? "Enter shop phoneNumber or Check phoneNumber" :null,
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
                      if (widget.placeName == "Jewar") {
                        if (shopName == null){
                          shopName = widget.shopName;
                        }
                        if(shopNumber == null){
                          shopNumber = widget.phoneNumber;
                        }
                        await database
                            .updateJewarShop(shopName, shopNumber,widget.id)
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
                        if (shopName == null){
                          shopName = widget.shopName;
                        }
                        if(shopNumber == null){
                          shopNumber = widget.phoneNumber;
                        }
                        await database
                            .updateTappalShop(shopName, shopNumber,widget.id)
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
                        if (shopName == null){
                          shopName = widget.shopName;
                        }
                        if(shopNumber == null){
                          shopNumber = widget.phoneNumber;
                        }
                        await database
                            .updateLocalShop(shopName, shopNumber,widget.id)
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
                        if (shopName == null){
                          shopName = widget.shopName;
                        }
                        if(shopNumber == null){
                          shopNumber = widget.phoneNumber;
                        }
                        await database
                            .updateJhangirpurShop(shopName, shopNumber,widget.id)
                            .then((val) {
                          setState(() {
                            _isLoading = false;
                            Navigator.pop(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Jhangirpur()));
                          });
                        });
                      }
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
