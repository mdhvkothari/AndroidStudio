import 'package:accounts/authenticate/register.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  Future<void> addShop(Map data, String uid, String id) async {
    return await Firestore.instance
        .collection("Accounts")
        .document(uid)
        .collection("shops")
        .document(id)
        .setData(data)
        .catchError((e) {
      print(e.toString());
    });
  }

  getShops(String uid) async {
    return await Firestore.instance
        .collection("Accounts")
        .document(uid)
        .collection("shops")
        .orderBy("shopName")
        .snapshots();
  }

  Future<void> updateShopData(
      String uid, String id, String shopName, String shopNumber) async {
    return await Firestore.instance
        .collection('Accounts')
        .document(uid)
        .collection("shops")
        .document(id)
        .updateData({"shopName": shopName, "phone": shopNumber}).catchError(
            (e) {
      print(e.toString());
    });
  }

  Future<void> deleteShop(String uid, String id) async {
    return await Firestore.instance
        .collection("Accounts")
        .document(uid)
        .collection("shops")
        .document(id)
        .delete()
        .catchError((e) {
      print(e.toString());
    });
  }

  Future<void> addingsaleBills(
      String uid, String id, String billId, Map data) async {
    return await Firestore.instance
        .collection("Accounts")
        .document(uid)
        .collection("shops")
        .document(id)
        .collection("Sales")
        .document(billId)
        .setData(data)
        .catchError((e) {
      print(e.toString());
    });
  }

  Future<void> addingtaxBills(
      String uid, String id, String billId, Map data) async {
    return await Firestore.instance
        .collection("Accounts")
        .document(uid)
        .collection("shops")
        .document(id)
        .collection("Tax")
        .document(billId)
        .setData(data)
        .catchError((e) {
      print(e.toString());
    });
  }
}
