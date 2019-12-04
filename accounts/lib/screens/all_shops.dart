import 'package:flutter/material.dart';
import './adding_shop.dart';
import './all_bills.dart';
import 'dart:async';
import 'package:accounts/models/accounts.dart';
import 'package:accounts/utils/database_helper.dart';
import 'package:sqflite/sqflite.dart';

class AllShop extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return AllShopState();
  }
}

class AllShopState extends State<AllShop> {
  Account account;
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Account>accountList;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    if (accountList == null) {
      accountList = List<Account>();
      updateListView();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("AnandGeneralStore"),
      ),
      body: getNoteListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint("FAB click");
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return AddingShop();
          }));
        },
        tooltip: "Add Shop",
        child: Icon(Icons.add),
      ),
    );
  }

  ListView getNoteListView() {
    TextStyle titleStyle = Theme
        .of(context)
        .textTheme
        .subhead;

    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext, int position) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.yellow,
              child: Icon(Icons.perm_identity),

            ),
            title: Text(
              this.accountList[position].shopName, style: titleStyle,),
            subtitle: Text(
              this.accountList[position].areaOfShop, style: titleStyle,),
            trailing: GestureDetector(
              child: Icon(Icons.delete),
              onTap: (){
                _delete(context, accountList[position]);
              },
            ),
            onTap: () {
              debugPrint("ListTile Trapped");
              navigateToDetail();
            },
          ),);

      },

    );
  }
  void navigateToDetail()async{
    bool result =await Navigator.push(context, MaterialPageRoute(builder: (context){
      return BillDetail();
    }));
    if(result == true){
      updateListView();
    }
  }

  void _delete(BuildContext context, Account account) async {
    int result = await databaseHelper.deleteAccount(account.id);
    if (result != 0) {
      _showSnackBar(context, 'Shop deleted Sucessfully');
      updateListView();
    }
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    Scaffold.of(context).showSnackBar(snackBar);
  }

  void updateListView(){
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database){
      Future<List<Account>> accountListFuture = databaseHelper.getAccountList();
      accountListFuture.then((accountList){
        setState((){
          this.accountList = accountList;
          this.count = accountList.length;
        });
      });
    });
  }
}
