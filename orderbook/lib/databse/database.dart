import 'package:cloud_firestore/cloud_firestore.dart';

class Database{
  Future<void> addData(Map orderData,String id)async{
    await Firestore.instance.collection("Order").document(id).setData(orderData).catchError((e){
      print(e.toString());
    });
  }
}
