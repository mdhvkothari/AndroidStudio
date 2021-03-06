import 'package:firebase_auth/firebase_auth.dart';
import 'package:skype_clone/Resources/firebase_method.dart';
import 'package:skype_clone/models/user.dart';

class FirebaseRepository{
  FirebaseMethods _firebaseMethods = FirebaseMethods();

  Future<FirebaseUser> getCurrentUser() => _firebaseMethods.getCurrentUser();

  Future<FirebaseUser> signIn() => _firebaseMethods.signIn();

  Future<bool> authenticateUser(FirebaseUser user)=> _firebaseMethods.authenticateUser(user);

  Future<void> addDataToDb(FirebaseUser user)=> _firebaseMethods.addDataToDb(user); 

  Future<void> signOut() => _firebaseMethods.signOut();

  Future<List<User>> fetchAllUsers(FirebaseUser user)=> _firebaseMethods.fetchAllUsers(user);
}