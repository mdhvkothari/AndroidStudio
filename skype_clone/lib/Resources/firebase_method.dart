import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:skype_clone/models/user.dart';
import 'package:skype_clone/utils/Utilities.dart';

class FirebaseMethods{
  
  final FirebaseAuth _auth = FirebaseAuth.instance;
  GoogleSignIn _googleSignIn = GoogleSignIn();
  static final Firestore firestore = Firestore.instance;
  

  //user model
  User user = User();

  //for current user
  Future<FirebaseUser> getCurrentUser() async{
    FirebaseUser currentUser;
    currentUser = await _auth.currentUser();
    return currentUser;
  }

  //for login

  Future<FirebaseUser> signIn() async{

    GoogleSignInAccount _signInAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication _signInAuthentication = await _signInAccount.authentication;
    
    final AuthCredential credential = GoogleAuthProvider.getCredential(idToken: _signInAuthentication.idToken,accessToken: _signInAuthentication.accessToken);

    AuthResult result = await _auth.signInWithCredential(credential);
    FirebaseUser user = result.user;

    return user;

  }

  //authenticateUser
 
  Future<bool> authenticateUser(FirebaseUser user) async{
    //we check get the data of user which when user login with google
    QuerySnapshot result = await firestore.collection("user").where("email",isEqualTo:user.email).getDocuments();
    
    //we put data into list of document snapshot
    final List<DocumentSnapshot> docs = result.documents;
  
    // now if user is registered then length of the docs > 0 or else less than 0
    return docs.length == 0 ? true : false; 

  }
  
  // adding data to db
  Future<void> addDataToDb(FirebaseUser currentUser) async{

    String username = Utils.getUserName(currentUser.email) ;
    
    user = User(
      uid: currentUser.uid,
      email: currentUser.email,
      name: currentUser.displayName,
      profilePhoto: currentUser.photoUrl,
      username: username,
    );

    firestore.collection("users").document(currentUser.uid).setData(user.toMap(user));

  }

  Future<void> signOut() async{
    await _googleSignIn.disconnect();
    await _googleSignIn.signOut();
    return await _auth.signOut();
  }

  //this method is for search button
  Future<List<User>> fetchAllUsers(FirebaseUser currentUser) async{
    List<User> userList = List<User>();

    QuerySnapshot querySnapshot = await firestore.collection("users").getDocuments();
    for(var i=0;i<querySnapshot.documents.length;i++){
      if(querySnapshot.documents[i].documentID != user.uid){
        userList.add(User.formMap(querySnapshot.documents[i].data));
      }
    }

    return userList;

  }

}