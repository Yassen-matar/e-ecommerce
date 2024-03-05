import 'package:dartz/dartz.dart';
import 'package:untitled/core/failure/failure.dart';

import '../entity/user_case.dart';

abstract class SignInRepo {
   Future<Either<Failure, UserSignInEntity>> postSignInUser ({required String email, required String password});
}
