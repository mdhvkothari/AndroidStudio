import 'package:news/resources/firebase_method.dart';

class FirebaseRepository{
  FirebaseMethod _firebaseMethod = FirebaseMethod();
  Future<void> signOut() => _firebaseMethod.signOut();
}