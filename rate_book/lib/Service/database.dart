import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  Future<void> addingData(String city, String item, Map data, String id,String id2) async {
    await Firestore.instance
        .collection(city)
        .document(id)
        .setData(data)
        .catchError((e) {
      print(e.toString());
    });
  }

  getData(String city, String item) async {
    return await Firestore.instance
        .collection(city)
        .document(item)
        .collection(item)
        .snapshots();
  }
}
