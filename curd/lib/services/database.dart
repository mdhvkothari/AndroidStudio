import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curd/model/saleModel.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  final CollectionReference saleCollection =
      Firestore.instance.collection('sale');
  final CollectionReference taxCollection =
      Firestore.instance.collection('tax');

  //updating data
  Future updateSaleData(String name, int billNo, int amount, String comment,
      List credit, String billDate, List dateOfCredit) async {
    return await saleCollection.document(uid).setData({
      'sale': [
        {
          'name': name,
          'bill_number': billNo,
          'amount': amount,
          'comment': comment,
          'credit': credit,
          'Bill date': billDate,
          'Date of credit': dateOfCredit,
        }
      ]
    });
  }

  Future updateTaxData(String name, int billNo, int amount, String comment,
      int chequeNo, int credit, String dateOfCheque , String date) async {
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
          'dateOfCheque': dateOfCheque,
        }
      ]
    });
  }

  //sale list from snapshot
  List<SaleData> _saleDataFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((data){
       SaleData(
         name:data.data["name"] ?? 'name',
         billNumber: data.data['bill_number'] ?? 0,
         comment: data.data['comment'] ?? 'comment',
         dateOfBill: data.data['Bill date'] ?? 'dateOfBill',
         credit: data.data['credit'],
         dateOfCredit: data.data['Date of credit'],
       );
    }).toList();
  }



  //stream of sale documents
  Stream<List<SaleData>> get sale{
    return saleCollection.snapshots().map(_saleDataFromSnapshot);
  }
  //stream of tax documents
  Stream<QuerySnapshot> get tax{
    return taxCollection.snapshots();
  }


}
