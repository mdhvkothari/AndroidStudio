import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  Future<void> addShop(Map shopMap, String id) async {
    await Firestore.instance
        .collection("Jewar")
        .document(id)
        .setData(shopMap)
        .catchError((e) {
      print(e.toString());
    });
  }

  Future<void> addJewarSaleBill(
      Map saleBillMap, String id, String shopId) async {
    await Firestore.instance
        .collection("Jewar")
        .document(shopId)
        .collection("Sale")
        .document(id)
        .setData(saleBillMap)
        .catchError((e) {
      print(e.toString());
    });
  }

  Future<void> addJewarTaxBill(
      Map saleBillMap, String id, String shopId) async {
    await Firestore.instance
        .collection("Jewar")
        .document(shopId)
        .collection("Tax")
        .document(id)
        .setData(saleBillMap)
        .catchError((e) {
      print(e.toString());
    });
  }

  Future<void> addCreditSaleMoney(
      String shopId, String billId, Map creditDetails) async {
    await Firestore.instance
        .collection("Jewar")
        .document(shopId)
        .collection("Sale")
        .document(billId)
        .collection("Credit")
        .document()
        .setData(creditDetails)
        .catchError((e) {
      print(e.toString());
    });
  }

  Future<void> addCreditTaxMoney(
      String shopId, String billId, Map creditDetails) async {
    await Firestore.instance
        .collection("Jewar")
        .document(shopId)
        .collection("Tax")
        .document(billId)
        .collection("Credit")
        .document()
        .setData(creditDetails)
        .catchError((e) {
      print(e.toString());
    });
  }

  getJewarShop() async {
    return await Firestore.instance
        .collection("Jewar")
        .orderBy("shopName")
        .snapshots();
  }

  getJewarSaleBill(String shopId) async {
    return await Firestore.instance
        .collection("Jewar")
        .document(shopId)
        .collection("Sale")
        .orderBy("billNumber", descending: true)
        .snapshots();
  }

  getJewarTaxBill(String shopId) async {
    return await Firestore.instance
        .collection("Jewar")
        .document(shopId)
        .collection("Tax")
        .orderBy("billNumber", descending: true)
        .snapshots();
  }

  getJewarParticularSaleBill(String shopId, String billId) async {
    return await Firestore.instance
        .collection("Jewar")
        .document(shopId)
        .collection("Sale")
        .document(billId)
        .snapshots();
  }

  getJewarParticularSaleBillCredit(String shopId, String billId) async {
    return await Firestore.instance
        .collection("Jewar")
        .document(shopId)
        .collection("Sale")
        .document(billId)
        .collection("Credit")
        .orderBy("date")
        .snapshots();
  }

  getJewarParticularTaxBillCredit(String shopId, String billId) async {
    return await Firestore.instance
        .collection("Jewar")
        .document(shopId)
        .collection("Tax")
        .document(billId)
        .collection("Credit")
        .snapshots();
  }
}
