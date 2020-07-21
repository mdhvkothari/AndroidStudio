import 'package:cloud_firestore/cloud_firestore.dart';

class Database{
  getAllData() async {
    return await Firestore.instance.collection("Order").orderBy("date").snapshots();
  }
}