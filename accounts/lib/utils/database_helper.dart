import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:accounts/models/accounts.dart';

class DatabaseHelper{
  static DatabaseHelper _databaseHelper;
  static Database _database;

  String accountTable = 'account_table';
  String colId = 'id';
  String colShopName = 'shopName';
  String colAreaOfShop = 'areaofShop';
  String colBillAmount = 'billAmount';
  String colBillNumber =' billNumber';
  String colDate = 'date';
  String colBillAbout = 'billAbout';

  DatabaseHelper._createInstance();

  factory DatabaseHelper(){
    if(_databaseHelper == null){
      _databaseHelper = DatabaseHelper._createInstance();
    }
    return _databaseHelper;
  }
  Future <Database> get database async{
    if(_database == null){
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async{
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'accounts.db';

    var accountsDatabase = await openDatabase(path,version: 1,onCreate: _createDb);
    return accountsDatabase;
  }

  void _createDb(Database db,int newVersion)async{
    await db.execute('CREATE TABLE $accountTable($colId INTEGRE PRIMARY KEY AUTOINCREMENT,$colShopName TEXT,$colAreaOfShop TEXT,$colBillNumber TEXT,$colBillAmount INTEGER,$colBillAbout TEXT)');
  }
  //fetch
  Future<List<Map<String,dynamic>>> getNoteMapList() async{
    Database db = await this.database;

    var result = await db.query(accountTable);
    return result;
  }

  //insert
  Future<int> insertAccount(Account account) async{
    Database db = await this.database;
    var result = await db.insert(accountTable,account.toMap());
    return result;
  }

  //update
  Future<int> updateAccount(Account account) async{
    var db = await this.database;
    var result = await db.update(accountTable, account.toMap(), where: '$colId = ?',whereArgs: [account.id]);
    return result;
  }
  //delete

  Future<int> deleteAccount(int id) async{
    var db = await this.database;
    int result = await db.rawDelete('DELETE FROM $accountTable WHERE $colId = $id');
    return result;

  }
  //get number from database
  Future <int> getCount()async{
    Database db = await this.database;
    List <Map<String,dynamic>> x = await db.rawQuery('SELECT COUNT (*) FROM $accountTable');
    int result = Sqflite.firstIntValue(x);
    return result;
  }

  //convert map list into  note list

  Future<List<Account>>  getAccountList() async{
    var accountMapList = await getNoteMapList();
    int count = accountMapList.length;

    List<Account> accountList = List<Account>();
    //for loop to create a 'Note list' from 'map list'
    for(int i=0;i<count;i++){
      accountList.add(Account.fromMapObject(accountMapList[i]));
    }
    return accountList;
  }
}