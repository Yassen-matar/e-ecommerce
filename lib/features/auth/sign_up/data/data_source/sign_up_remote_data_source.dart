// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../model/user_model.dart';

abstract class SignUpRomteDataSource {
  Future<UserModel> postSignUpUser(
      {required String email, required String password});
  Future<UserModel> postSignUpUserWithGoogle(
  ); 
   // Future<UserModel> postSignUpUserWithFacebook(
  //); 
}

class SignUpRomteDataSourceImpl extends SignUpRomteDataSource {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  @override
  Future<UserModel> postSignUpUser(
      {required String email, required String password}) async {
    final UserCredential userCredential =
        await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    await firebaseAuth.currentUser!.sendEmailVerification();
    return UserModel(
      email: userCredential.user?.email ?? 'email',
      name: userCredential.user?.displayName ?? 'username',
    );
  }

  @override
  Future<UserModel> postSignUpUserWithGoogle(
   ) async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    ); 
    
       var userCredential = await firebaseAuth.signInWithCredential(credential);
    // Once signed in, return the UserCredential
     return UserModel(
      email: userCredential.user?.email ?? 'email',
      name: userCredential.user?.displayName ?? 'username',
    );
  }
  
//   @override
//   Future<UserModel> postSignUpUserWithFacebook() async {
//  // Trigger the sign-in flow
//   final LoginResult loginResult = await FacebookAuth.instance.login();

//   // Create a credential from the access token
//   final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);

//   // Once signed in, return the UserCredential
//      var userCredential =  await firebaseAuth.signInWithCredential(facebookAuthCredential); 
//     // Once signed in, return the UserCredential
//      return UserModel(
//       email: userCredential.user?.email ?? 'email',
//       name: userCredential.user?.displayName ?? 'username',
//     );
//   }
  }

