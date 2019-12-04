import 'package:flutter/material.dart';
import 'dart:async';
import 'package:accounts/models/accounts.dart';
import 'package:accounts/utils/database_helper.dart';
import 'package:sqflite/sqflite.dart';

class AddingShop extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AddingShopState();
  }
}

class AddingShopState extends State<AddingShop> {
  Account account;
  DatabaseHelper helper = DatabaseHelper();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;
    titleController.text = account.shopName;
    descriptionController.text = account.areaOfShop;
    return Scaffold(
      appBar: AppBar(
        title: Text("AddNewShop"),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: TextField(
                controller: titleController,
                style: textStyle,
                onChanged: (value) {
                  updateName();
                  debugPrint("Something change in Title Text Field");
                },
                decoration: InputDecoration(
                    labelText: 'Shop Name',
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: TextField(
                controller: descriptionController,
                style: textStyle,
                onChanged: (value) {
                  updateDescription();
                  debugPrint(
                      "Something change in Title Description Field");
                },
                decoration: InputDecoration(
                    labelText: 'Shop Area',
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
                            _save();
                            moveToLastScreen();
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

                            _delete();
                            moveToLastScreen();
                            debugPrint("Delete button clicked");
                          });
                        }),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void moveToLastScreen(){{
    Navigator.pop(context,true);
  }
  }
  void updateName(){
    account.shopName = titleController.text;
  }
  void updateDescription(){
    account.areaOfShop = descriptionController.text;
  }
  void _save() async{
    int result;
    if(account.id != null){
      result =  await helper.updateAccount(account);
    }
    else{
      result = await helper.insertAccount(account);
    }
    if(result !=0 ){
      _showAlertDialog('Status','Shop Saved Sucessfully');
    }
    else{
      _showAlertDialog('Status','Problem in saving shop');
    }
  }
  void _delete() async {
    if(account.id == null){
      _showAlertDialog('Status','No Shop was deleted');
      return ;
    }
    int result = await helper.deleteAccount(account.id);
    if(result!=0){
      _showAlertDialog('Status', 'Note Deleted Sucessfully');

    }
    else{
      _showAlertDialog('status', 'Error');
    }

  }
  void _showAlertDialog(String title,String message){
    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    showDialog(context: context,builder: (_)=>alertDialog);
  }







}
