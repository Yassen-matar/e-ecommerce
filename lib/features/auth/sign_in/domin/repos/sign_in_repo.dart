import 'package:dartz/dartz.dart';
import 'package:untitled/core/failure/failure.dart';

import '../entity/user_case.dart';

abstract class SignInRepo {
  Future<Either<Failure, UserSignInEntity>> postSignInUser(
      {required String email, required String password});
  Future<Either<Failure, UserSignInEntity>> postSignUpUserWithGoogle();
  Future<Either<Failure, UserSignInEntity>> postSignUpUserWithGithub();
   Future<Either<Failure, UserSignInEntity>> resetPassword({required String email});
}
