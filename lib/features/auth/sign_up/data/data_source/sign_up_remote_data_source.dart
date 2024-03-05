// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../model/user_model.dart';

abstract class SignUpRomteDataSource {
  Future<UserModel> postSignUpUser(
      {required String email, required String password});
  Future<UserModel> postSignUpUserWithGoogle();
  Future<UserModel> postSignUpUserWithGithub();
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
  Future<UserModel> postSignUpUserWithGoogle() async {
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

  @override
  Future<UserModel> postSignUpUserWithGithub() async {

    GithubAuthProvider githubAuthProvider = GithubAuthProvider();
    githubAuthProvider.setCustomParameters({
      'allow_signup': 'true',
    });
      var userCredential =
    await firebaseAuth.signInWithProvider(githubAuthProvider);
    return UserModel(
      email: userCredential.user?.email ?? 'email',
      name: userCredential.user?.displayName ?? 'username',
    );
  }
}
