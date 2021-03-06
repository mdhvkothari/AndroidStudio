import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/models/brew_model.dart';
import 'package:firebase/models/usermodels.dart';

class Database{
  final String uid;
  Database({this.uid});

  final CollectionReference brewCollection = Firestore.instance.collection('brews');

  Future updateUserData(String sugars,String name,int strength) async{
    return await brewCollection.document(uid).setData({
      'name': name,
      'sugars': sugars,
      'strength':strength,
    });
  }

  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return Brew(
        name: doc.data['name'] ?? '',
        strength: doc.data['strength'] ?? 0,
        sugars: doc.data['sugars'] ?? 0,
      );
    }).toList();
  }

  //for getting userdata
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot){
    return UserData(
      uid: uid,
      name: snapshot.data['name'],
      sugars: snapshot.data['sugars'],
      strength: snapshot.data['strength'],
    );  
  }

  Stream<List<Brew>> get brews{
    return brewCollection.snapshots().map(_brewListFromSnapshot);
  }

  //get user doc stream
  Stream<UserData> get userData{
    return brewCollection.document(uid).snapshots().map(_userDataFromSnapshot);
  }

}