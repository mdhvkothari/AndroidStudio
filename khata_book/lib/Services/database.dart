import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  Future<void> addJewarShop(Map shopMap, String id) async {
    await Firestore.instance
        .collection("Jewar")
        .document(id)
        .setData(shopMap)
        .catchError((e) {
      print(e.toString());
    });
  }

  Future<void> updateJewarShop(String shopName, String phone, String id) async {
    await Firestore.instance
        .collection("Jewar")
        .document(id)
        .updateData({"shopName": shopName, "phone": phone}).catchError((e) {
      print(e.toString());
    });
  }

  Future<void> addTappalShop(Map shopMap, String id) async {
    await Firestore.instance
        .collection("Tappal")
        .document(id)
        .setData(shopMap)
        .catchError((e) {
      print(e.toString());
    });
  }
  Future<void> updateTappalShop(String shopName, String phone, String id) async {
    await Firestore.instance
        .collection("Tappal")
        .document(id)
        .updateData({"shopName": shopName, "phone": phone}).catchError((e) {
      print(e.toString());
    });
  }

  Future<void> addLocalShop(Map shopMap, String id) async {
    await Firestore.instance
        .collection("Local")
        .document(id)
        .setData(shopMap)
        .catchError((e) {
      print(e.toString());
    });
  }
  Future<void> updateLocalShop(String shopName, String phone, String id) async {
    await Firestore.instance
        .collection("Local")
        .document(id)
        .updateData({"shopName": shopName, "phone": phone}).catchError((e) {
      print(e.toString());
    });
  }
  Future<void> addJhangirpurShop(Map shopMap, String id) async {
    await Firestore.instance
        .collection("Jhangirpur")
        .document(id)
        .setData(shopMap)
        .catchError((e) {
      print(e.toString());
    });
  }
  Future<void> updateJhangirpurShop(String shopName, String phone, String id) async {
    await Firestore.instance
        .collection("Jhangirpur")
        .document(id)
        .updateData({"shopName": shopName, "phone": phone}).catchError((e) {
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

  Future<void> updateJewarSaleBill(String shopId, String id, String billNumber,
      String billAmount, String comment, String date) async {
    await Firestore.instance
        .collection("Jewar")
        .document(shopId)
        .collection("Sale")
        .document(id)
        .updateData({
      "billAmount": billAmount,
      "billNumber": billNumber,
      "comment": comment,
      "date": date
    }).catchError((e) {
      print(e.toString());
    });
  }

  Future<void> addTappalSaleBill(
      Map saleBillMap, String id, String shopId) async {
    await Firestore.instance
        .collection("Tappal")
        .document(shopId)
        .collection("Sale")
        .document(id)
        .setData(saleBillMap)
        .catchError((e) {
      print(e.toString());
    });
  }
  Future<void> updateTappalSaleBill(String shopId, String id, String billNumber,
      String billAmount, String comment, String date) async {
    await Firestore.instance
        .collection("Tappal")
        .document(shopId)
        .collection("Sale")
        .document(id)
        .updateData({
      "billAmount": billAmount,
      "billNumber": billNumber,
      "comment": comment,
      "date": date
    }).catchError((e) {
      print(e.toString());
    });
  }
  Future<void> addLocalSaleBill(
      Map saleBillMap, String id, String shopId) async {
    await Firestore.instance
        .collection("Local")
        .document(shopId)
        .collection("Sale")
        .document(id)
        .setData(saleBillMap)
        .catchError((e) {
      print(e.toString());
    });
  }
  Future<void> updateLocalSaleBill(String shopId, String id, String billNumber,
      String billAmount, String comment, String date) async {
    await Firestore.instance
        .collection("Local")
        .document(shopId)
        .collection("Sale")
        .document(id)
        .updateData({
      "billAmount": billAmount,
      "billNumber": billNumber,
      "comment": comment,
      "date": date
    }).catchError((e) {
      print(e.toString());
    });
  }
  Future<void> addJhangirpurSaleBill(
      Map saleBillMap, String id, String shopId) async {
    await Firestore.instance
        .collection("Jhangirpur")
        .document(shopId)
        .collection("Sale")
        .document(id)
        .setData(saleBillMap)
        .catchError((e) {
      print(e.toString());
    });
  }
  Future<void> updateJhangirpurSaleBill(String shopId, String id, String billNumber,
      String billAmount, String comment, String date) async {
    await Firestore.instance
        .collection("Jhangirpur")
        .document(shopId)
        .collection("Sale")
        .document(id)
        .updateData({
      "billAmount": billAmount,
      "billNumber": billNumber,
      "comment": comment,
      "date": date
    }).catchError((e) {
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

  Future<void> editJewarTaxBill(String shopId, String billId, String billNo,
      String billAmount, String date, String comment) async {
    await Firestore.instance
        .collection("Jewar")
        .document(shopId)
        .collection("Tax")
        .document(billId)
        .updateData({
      "billNumber": billNo,
      "billAmount": billAmount,
      "date": date,
      "comment": comment
    }).catchError((e){
      print(e.toString());
    });
  }


  Future<void> addTappalTaxBill(
      Map saleBillMap, String id, String shopId) async {
    await Firestore.instance
        .collection("Tappal")
        .document(shopId)
        .collection("Tax")
        .document(id)
        .setData(saleBillMap)
        .catchError((e) {
      print(e.toString());
    });
  }
  Future<void> editTappalTaxBill(String shopId, String billId, String billNo,
      String billAmount, String date, String comment) async {
    await Firestore.instance
        .collection("Tappal")
        .document(shopId)
        .collection("Tax")
        .document(billId)
        .updateData({
      "billNumber": billNo,
      "billAmount": billAmount,
      "date": date,
      "comment": comment
    }).catchError((e){
      print(e.toString());
    });
  }
  Future<void> addLocalTaxBill(
      Map saleBillMap, String id, String shopId) async {
    await Firestore.instance
        .collection("Local")
        .document(shopId)
        .collection("Tax")
        .document(id)
        .setData(saleBillMap)
        .catchError((e) {
      print(e.toString());
    });
  }
  Future<void> editLocalTaxBill(String shopId, String billId, String billNo,
      String billAmount, String date, String comment) async {
    await Firestore.instance
        .collection("Local")
        .document(shopId)
        .collection("Tax")
        .document(billId)
        .updateData({
      "billNumber": billNo,
      "billAmount": billAmount,
      "date": date,
      "comment": comment
    }).catchError((e){
      print(e.toString());
    });
  }
  Future<void> addJhangirpurTaxBill(
      Map saleBillMap, String id, String shopId) async {
    await Firestore.instance
        .collection("Jhangirpur")
        .document(shopId)
        .collection("Tax")
        .document(id)
        .setData(saleBillMap)
        .catchError((e) {
      print(e.toString());
    });
  }
  Future<void> editJhangirpurTaxBill(String shopId, String billId, String billNo,
      String billAmount, String date, String comment) async {
    await Firestore.instance
        .collection("Jhangirpur")
        .document(shopId)
        .collection("Tax")
        .document(billId)
        .updateData({
      "billNumber": billNo,
      "billAmount": billAmount,
      "date": date,
      "comment": comment
    }).catchError((e){
      print(e.toString());
    });
  }

  Future<void> addJewarCreditSaleMoney(
      String shopId, String billId, Map creditDetails, String id) async {
    await Firestore.instance
        .collection("Jewar")
        .document(shopId)
        .collection("Sale")
        .document(billId)
        .collection("Credit")
        .document(id)
        .setData(creditDetails)
        .catchError((e) {
      print(e.toString());
    });
  }

  Future<void> editJewarCreditSaleMoney(String shopId, String billId, String id,
      String creditAmount, String date) async {
    await Firestore.instance
        .collection("Jewar")
        .document(shopId)
        .collection("Sale")
        .document(billId)
        .collection("Credit")
        .document(id)
        .updateData({"creditAmount": creditAmount, "date": date}).catchError(
            (e) {
      print(e.toString());
    });
  }

  Future<void> addTappalCreditSaleMoney(
      String shopId, String billId, Map creditDetails,String id) async {
    await Firestore.instance
        .collection("Tappal")
        .document(shopId)
        .collection("Sale")
        .document(billId)
        .collection("Credit")
        .document(id)
        .setData(creditDetails)
        .catchError((e) {
      print(e.toString());
    });
  }
  Future<void> editTappalCreditSaleMoney(String shopId, String billId, String id,
      String creditAmount, String date) async {
    await Firestore.instance
        .collection("Tappal")
        .document(shopId)
        .collection("Sale")
        .document(billId)
        .collection("Credit")
        .document(id)
        .updateData({"creditAmount": creditAmount, "date": date}).catchError(
            (e) {
          print(e.toString());
        });
  }

  Future<void> addLocalCreditSaleMoney(
      String shopId, String billId, Map creditDetails,String id) async {
    await Firestore.instance
        .collection("Local")
        .document(shopId)
        .collection("Sale")
        .document(billId)
        .collection("Credit")
        .document(id)
        .setData(creditDetails)
        .catchError((e) {
      print(e.toString());
    });
  }
  Future<void> editLocalCreditSaleMoney(String shopId, String billId, String id,
      String creditAmount, String date) async {
    await Firestore.instance
        .collection("Local")
        .document(shopId)
        .collection("Sale")
        .document(billId)
        .collection("Credit")
        .document(id)
        .updateData({"creditAmount": creditAmount, "date": date}).catchError(
            (e) {
          print(e.toString());
        });
  }
  Future<void> addJhangirpurCreditSaleMoney(
      String shopId, String billId, Map creditDetails,String id) async {
    await Firestore.instance
        .collection("Jhangirpur")
        .document(shopId)
        .collection("Sale")
        .document(billId)
        .collection("Credit")
        .document(id)
        .setData(creditDetails)
        .catchError((e) {
      print(e.toString());
    });
  }
  Future<void> editJhangirpurCreditSaleMoney(String shopId, String billId, String id,
      String creditAmount, String date) async {
    await Firestore.instance
        .collection("Jhangirpur")
        .document(shopId)
        .collection("Sale")
        .document(billId)
        .collection("Credit")
        .document(id)
        .updateData({"creditAmount": creditAmount, "date": date}).catchError(
            (e) {
          print(e.toString());
        });
  }
  Future<void> addJewarCreditTaxMoney(
      String shopId, String billId, String id, Map creditDetails) async {
    await Firestore.instance
        .collection("Jewar")
        .document(shopId)
        .collection("Tax")
        .document(billId)
        .collection("Credit")
        .document(id)
        .setData(creditDetails)
        .catchError((e) {
      print(e.toString());
    });
  }

  Future<void> editJewarTaxCredit(
      String shopId,
      String billId,
      String id,
      String bank,
      String chequeNumber,
      String creditAmount,
      String date) async {
    await Firestore.instance
        .collection("Jewar")
        .document(shopId)
        .collection("Tax")
        .document(billId)
        .collection("Credit")
        .document(id)
        .updateData({
      "bank": bank,
      "chequeNumber": chequeNumber,
      "creditAmount": creditAmount,
      "date": date
    }).catchError((e) {
      print(e.toString());
    });
  }

  Future<void> addTappalCreditTaxMoney(
      String shopId, String billId, Map creditDetails,String id) async {
    await Firestore.instance
        .collection("Tappal")
        .document(shopId)
        .collection("Tax")
        .document(billId)
        .collection("Credit")
        .document(id)
        .setData(creditDetails)
        .catchError((e) {
      print(e.toString());
    });
  }


  Future<void> editTappalTaxCredit(
      String shopId,
      String billId,
      String id,
      String bank,
      String chequeNumber,
      String creditAmount,
      String date) async {
    await Firestore.instance
        .collection("Tappal")
        .document(shopId)
        .collection("Tax")
        .document(billId)
        .collection("Credit")
        .document(id)
        .updateData({
      "bank": bank,
      "chequeNumber": chequeNumber,
      "creditAmount": creditAmount,
      "date": date
    }).catchError((e) {
      print(e.toString());
    });
  }

  Future<void> addLocalCreditTaxMoney(
      String shopId, String billId, Map creditDetails,String id) async {
    await Firestore.instance
        .collection("Local")
        .document(shopId)
        .collection("Tax")
        .document(billId)
        .collection("Credit")
        .document(id)
        .setData(creditDetails)
        .catchError((e) {
      print(e.toString());
    });
  }

  Future<void> editLocalTaxCredit(
      String shopId,
      String billId,
      String id,
      String bank,
      String chequeNumber,
      String creditAmount,
      String date) async {
    await Firestore.instance
        .collection("Local")
        .document(shopId)
        .collection("Tax")
        .document(billId)
        .collection("Credit")
        .document(id)
        .updateData({
      "bank": bank,
      "chequeNumber": chequeNumber,
      "creditAmount": creditAmount,
      "date": date
    }).catchError((e) {
      print(e.toString());
    });
  }

  Future<void> addJhangirpurCreditTaxMoney(
      String shopId, String billId, Map creditDetails,String id) async {
    await Firestore.instance
        .collection("Jhangirpur")
        .document(shopId)
        .collection("Tax")
        .document(billId)
        .collection("Credit")
        .document(id)
        .setData(creditDetails)
        .catchError((e) {
      print(e.toString());
    });
  }

  Future<void> editJhangirpurTaxCredit(
      String shopId,
      String billId,
      String id,
      String bank,
      String chequeNumber,
      String creditAmount,
      String date) async {
    await Firestore.instance
        .collection("Jhangirpur")
        .document(shopId)
        .collection("Tax")
        .document(billId)
        .collection("Credit")
        .document(id)
        .updateData({
      "bank": bank,
      "chequeNumber": chequeNumber,
      "creditAmount": creditAmount,
      "date": date
    }).catchError((e) {
      print(e.toString());
    });
  }

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
