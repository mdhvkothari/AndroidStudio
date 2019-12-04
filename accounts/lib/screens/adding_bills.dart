import 'package:flutter/material.dart';

class AddingBillDetail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AddingBillDetailState();
  }
}

class AddingBillDetailState extends State<AddingBillDetail> {
  TextEditingController billnumberController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController aboutController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;
    return Scaffold(
        appBar: AppBar(
          title: Text("AddBill"),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: TextField(
                  controller: billnumberController,
                  style: textStyle,
                  onChanged: (value) {
                    debugPrint("Something change in Title Text Field");
                  },
                  decoration: InputDecoration(
                      labelText: 'Bill Number',
                      labelStyle: textStyle,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: TextField(
                  controller: amountController,
                  style: textStyle,
                  onChanged: (value) {
                    debugPrint(
                        "Something change in Title Description Field");
                  },
                  decoration: InputDecoration(
                      labelText: 'Amount',
                      labelStyle: textStyle,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: TextField(
                  controller: aboutController,
                  style: textStyle,
                  onChanged: (value) {
                    debugPrint(
                        "Something change in Title Description Field");
                  },
                  decoration: InputDecoration(
                      labelText: 'Description',
                      labelStyle: textStyle,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                          color: Theme.of(context).primaryColorDark,
                          textColor: Theme.of(context).primaryColorLight,
                          child: Text(
                            'Save',
                            textScaleFactor: 1.5,
                          ),
                          onPressed: () {
                            setState(() {
                              debugPrint("Save button clicked");
                            });
                          }),
                    ),
                    Container(
                      width: 5.0,
                    ),
                    Expanded(
                      child: RaisedButton(
                          color: Theme.of(context).primaryColorDark,
                          textColor: Theme.of(context).primaryColorLight,
                          child: Text(
                            'Delete',
                            textScaleFactor: 1.5,
                          ),
                          onPressed: () {
                            setState(() {
                              debugPrint("Delete button clicked");
                            });
                          }),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
