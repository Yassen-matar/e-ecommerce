// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../model/user_sign_in_model.dart';

abstract class SignInRomteDataSource {
  Future<UserSignInModel> postSignUpUser(
      {required String email, required String password});
  Future<UserSignInModel> postSignInUserWithGoogle();
  Future<UserSignInModel> postSignInUserWithGithub();
  Future resetPassword({
    required String email,
  });
}

class SignInRomteDataSourceImpl extends SignInRomteDataSource {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Future<UserSignInModel> postSignUpUser(
      {required String email, required String password}) async {
    final UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return UserSignInModel(
      email: userCredential.user?.email ?? 'email',
      name: userCredential.user?.displayName ?? 'username',
    );
  }

  @override
  Future<UserSignInModel> postSignInUserWithGithub() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    var userCredential = await firebaseAuth.signInWithCredential(credential);
    // Once signed in, return the UserCredential
    return UserSignInModel(
      email: userCredential.user?.email ?? 'email',
      name: userCredential.user?.displayName ?? 'username',
    );
  }

  @override
  Future<UserSignInModel> postSignInUserWithGoogle() async {
    GithubAuthProvider githubAuthProvider = GithubAuthProvider();
    githubAuthProvider.setCustomParameters({
      'allow_signup': 'true',
    });
    var userCredential =
        await firebaseAuth.signInWithProvider(githubAuthProvider);
    return UserSignInModel(
      email: userCredential.user?.email ?? 'email',
      name: userCredential.user?.displayName ?? 'username',
    );
  }
  
  @override
  Future resetPassword({required String email}) async{
    
        await firebaseAuth.sendPasswordResetEmail(email: email); 

  }
  }
