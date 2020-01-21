import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  final CollectionReference saleCollection =
      Firestore.instance.collection('sale');
  final CollectionReference taxCollection =
      Firestore.instance.collection('tax');

  //updating data
  Future updateSaleData(String name, int billNo, int amount, String comment,
      List credit, String date) async {
    return await saleCollection.document(uid).setData({
      'sale': [
        {
          'name': name,
          'bill_number': billNo,
          'amount': amount,
          'comment': comment,
          'credit': credit,
          'date': date
        }
      ]
    });
  }

  Future updateTaxData(String name, int billNo, int amount, String comment,
      int chequeNo, int credit, String date) async {
    return await taxCollection.document(uid).setData({
      'tax': [
        {
          'name': name,
          'bill_number': billNo,
          'amount': amount,
          'comment': comment,
          'chequeNo': chequeNo,
          'credit': credit,
          'date': date,
        }
      ]
    });
  }
}
