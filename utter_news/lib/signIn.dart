import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'profileScreen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class SingIn extends StatefulWidget {
  @override
  _SingInState createState() => _SingInState();
}

class _SingInState extends State<SingIn> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<FirebaseUser> _signIn(BuildContext context) async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);

    AuthResult result = await _firebaseAuth.signInWithCredential(credential);
    FirebaseUser userDetail = result.user;

    ProviderDetails providerInfo = ProviderDetails(userDetail.providerId);

    List<ProviderDetails> providerData = List<ProviderDetails>();
    providerData.add(providerInfo);

    UserDetails details = UserDetails(
        userDetail.providerId,
        userDetail.displayName,
        userDetail.photoUrl,
        userDetail.email,
        providerData);

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ProfileScreen(detailsUser: details)));

    return userDetail;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('uTTerNews'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 100.0,
            ),
            Container(
              width: 250.0,
              height: 250.0,
              child: Image.asset('assets/logo.png'),
            ),
            SizedBox(
              height: 30.0,
            ),
            Center(
              child: SizedBox(
                width: 175.0,
                child: TypewriterAnimatedTextKit(
                    text: ["uTTerNews"],
                    textStyle:
                        TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                    alignment:
                        AlignmentDirectional.topStart // or Alignment.topLeft
                    ),
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            Container(
              width: 250.0,
              child: RaisedButton(
                splashColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                color: Colors.teal,
                child: Text(
                  'Continue with Google',
                  style: TextStyle(color: Colors.black, fontSize: 18.0),
                ),
                onPressed: () => _signIn(context).catchError((e) => print(e)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UserDetails {
  final String providerDetails;
  final String userName;
  final String photoUrl;
  final String userEmail;
  final List<ProviderDetails> providerData;

  UserDetails(this.providerDetails, this.userName, this.photoUrl,
      this.userEmail, this.providerData);
}

class ProviderDetails {
  ProviderDetails(this.providerDetail);

  final String providerDetail;
}
