// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';

import '../model/user_sign_in_model.dart';


abstract class SignInRomteDataSource {
 Future<UserSignInModel> postSignUpUser(  {required String email, required String password});
}

class SignInRomteDataSourceImpl extends SignInRomteDataSource {
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
}
