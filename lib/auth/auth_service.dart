// import 'dart:developer';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
//
// class AuthSercive {
//   FirebaseAuth _auth = FirebaseAuth.instance;
//   Future<SignInSignUpResult> createUser({String email, String pass}) async {
//     try {
//       AuthResult result = await
//       _auth.createUserWithEmailAndPassword(email: email, password: pass);
//       return SignInSignUpResult(user: result.user);
//     } catch (e) {
//       return SignInSignUpResult(message: e.toString());
//     }
//   }
//
//   Future<SignInSignUpResult> signInWithEmail({String email, String pass}) async {
//     try {
//       AuthResult result = await
//       _auth.signInWithEmailAndPassword(email: email, password: pass);
//       return SignInSignUpResult(user: result.user);
//     } catch (e) {
//       return SignInSignUpResult(message: e.toString());
//     }
//   }
//
//   GoogleSignIn googleSignIn = GoogleSignIn(
//
//     scopes: [
//       'email',
//       'https://www.googleapis.com/auth/contacts.readonly'
//     ],
//   );
//
//   Future<SignInSignUpResult> signInWithGoogle() async {
//     try {
//       final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
//       final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
//       print("User ${googleSignInAuthentication.idToken}, ${googleSignInAuthentication.accessToken}");
//
//       final AuthCredential credential = GoogleAuthProvider.getCredential(
//           idToken: googleSignInAuthentication.idToken,
//           accessToken: googleSignInAuthentication.accessToken);
//       final AuthResult result = await (_auth.signInWithCredential(credential));
//       return SignInSignUpResult(user: result.user);
//     } catch (e) {
//       log("Exception ${e.toString()} ");
//       return SignInSignUpResult(message: e.toString());
//     }
//   }
//
//   void signOut() {
//     _auth.signOut();
//   }
//
//   Future<void> signOutGoogle() async {
//     await googleSignIn.signOut();
//   }
// }
//
// class SignInSignUpResult {
//   final FirebaseUser user;
//   final String message;
//   SignInSignUpResult({this.user, this.message});
// }
