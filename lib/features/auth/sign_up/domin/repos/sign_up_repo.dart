import 'package:dartz/dartz.dart';
import 'package:untitled/core/failure/failure.dart';
import 'package:untitled/features/auth/sign_up/domin/entity/user_case.dart';

abstract class SignUpRepo {
   Future<Either<Failure, UserEntity>> postSignUpUser({required String email, required String password}); 
   Future<Either<Failure, UserEntity>> postSignUpUserWithGoogle();  
     Future<Either<Failure, UserEntity>> postSignUpUserWithGithub(); 
}
