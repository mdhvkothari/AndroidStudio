import 'package:accounts/Service/database.dart';
import 'package:flutter/material.dart';

import 'loading.dart';

class editShop extends StatefulWidget {
  String shopName, phone,uid,id;

  editShop({this.shopName, this.phone,this.uid,this.id});

  @override
  _editShopState createState() => _editShopState();
}

class _editShopState extends State<editShop> {
  String shopName, shopNumber;
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
                  initialValue: widget.shopName,
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
                  initialValue: widget.phone,
                  decoration:
                  InputDecoration(hintText: 'Enter shopPhoneNumber'),
                  validator: (val) =>
                  val.isEmpty || val.length < 10
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

                      if (shopName == null) {
                        shopName = widget.shopName;
                      }
                      if (shopNumber == null) {
                        shopNumber = widget.phone;
                      }
                      await database
                          .updateShopData(widget.uid,widget.id,shopName, shopNumber)
                          .then((val) {
                        setState(() {
                          _isLoading = false;
                          Navigator.pop(
                              context);
                        });
                      });
                    }
                  },
                  color: Colors.pink[900],
                  child: Text("SAVE",style: TextStyle(color: Colors.white),),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
