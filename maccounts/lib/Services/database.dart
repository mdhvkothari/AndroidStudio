import 'package:cloud_firestore/cloud_firestore.dart';

class Database {

  getJewarShop() async {
    return await Firestore.instance
        .collection("Jewar")
        .orderBy("shopName")
        .snapshots();
  }

  getTappalShop() async {
    return await Firestore.instance
        .collection("Tappal")
        .orderBy("shopName")
        .snapshots();
  }

  getLocalShop() async {
    return await Firestore.instance
        .collection("Local")
        .orderBy("shopName")
        .snapshots();
  }

  getJhangirpurShop() async {
    return await Firestore.instance
        .collection("Jhangirpur")
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

  getTappalSaleBill(String shopId) async {
    return await Firestore.instance
        .collection("Tappal")
        .document(shopId)
        .collection("Sale")
        .orderBy("billNumber", descending: true)
        .snapshots();
  }

  getLocalSaleBill(String shopId) async {
    return await Firestore.instance
        .collection("Local")
        .document(shopId)
        .collection("Sale")
        .orderBy("billNumber", descending: true)
        .snapshots();
  }

  getJhangirpurSaleBill(String shopId) async {
    return await Firestore.instance
        .collection("Jhangirpur")
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

  getTappalTaxBill(String shopId) async {
    return await Firestore.instance
        .collection("Tappal")
        .document(shopId)
        .collection("Tax")
        .orderBy("billNumber", descending: true)
        .snapshots();
  }

  getLocalTaxBill(String shopId) async {
    return await Firestore.instance
        .collection("Local")
        .document(shopId)
        .collection("Tax")
        .orderBy("billNumber", descending: true)
        .snapshots();
  }

  getJhangirpurTaxBill(String shopId) async {
    return await Firestore.instance
        .collection("Jhangirpur")
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

  getTappalParticularSaleBill(String shopId, String billId) async {
    return await Firestore.instance
        .collection("Tappal")
        .document(shopId)
        .collection("Sale")
        .document(billId)
        .snapshots();
  }

  getLocalParticularSaleBill(String shopId, String billId) async {
    return await Firestore.instance
        .collection("Local")
        .document(shopId)
        .collection("Sale")
        .document(billId)
        .snapshots();
  }

  getJhangirpurParticularSaleBill(String shopId, String billId) async {
    return await Firestore.instance
        .collection("Jhangirpur")
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

  getTappalParticularSaleBillCredit(String shopId, String billId) async {
    return await Firestore.instance
        .collection("Tappal")
        .document(shopId)
        .collection("Sale")
        .document(billId)
        .collection("Credit")
        .orderBy("date")
        .snapshots();
  }

  getLocalParticularSaleBillCredit(String shopId, String billId) async {
    return await Firestore.instance
        .collection("Local")
        .document(shopId)
        .collection("Sale")
        .document(billId)
        .collection("Credit")
        .orderBy("date")
        .snapshots();
  }

  getJhangirpurParticularSaleBillCredit(String shopId, String billId) async {
    return await Firestore.instance
        .collection("Jhangirpur")
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

  getTappalParticularTaxBillCredit(String shopId, String billId) async {
    return await Firestore.instance
        .collection("Tappal")
        .document(shopId)
        .collection("Tax")
        .document(billId)
        .collection("Credit")
        .snapshots();
  }

  getLocalParticularTaxBillCredit(String shopId, String billId) async {
    return await Firestore.instance
        .collection("Local")
        .document(shopId)
        .collection("Tax")
        .document(billId)
        .collection("Credit")
        .snapshots();
  }

  getJhangirpurParticularTaxBillCredit(String shopId, String billId) async {
    return await Firestore.instance
        .collection("Jhangirpur")
        .document(shopId)
        .collection("Tax")
        .document(billId)
        .collection("Credit")
        .snapshots();
  }
}
