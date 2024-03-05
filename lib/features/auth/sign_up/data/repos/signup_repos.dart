// ignore_for_file: avoid_print

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled/features/auth/sign_up/data/data_source/sign_up_remote_data_source.dart';

import '../../../../../core/failure/failure.dart';
import '../../domin/entity/user_case.dart';
import '../../domin/repos/sign_up_repo.dart';

class SignUpRepoImpl extends SignUpRepo {
  SignUpRomteDataSource signUpRomteDataSource;
  SignUpRepoImpl(this.signUpRomteDataSource);
  @override
Future<Either<Failure, UserEntity>> postSignUpUser( {required String email, required String password}) async {
    try {
        final  result = await signUpRomteDataSource.postSignUpUser(email : email, password : password,);
          return Right(result);
       } on FirebaseAuthException catch (e) {
       return Left(SignUpWithEmailAndPasswordFailure.fromCode(e.code));
    } catch (_) {
     return const Left(SignUpWithEmailAndPasswordFailure());
    }
  }
  
  @override
  Future<Either<Failure, UserEntity>> postSignUpUserWithGoogle() async {
         try {
        final  result = await signUpRomteDataSource.postSignUpUserWithGoogle();
          return Right(result);
       } on FirebaseAuthException catch (e) {
       return Left(SignUpWithEmailAndPasswordFailure.fromCode(e.code));
    } catch (_) {
     return const Left(SignUpWithEmailAndPasswordFailure());
    }
  }
  
  // @override
  // Future<Either<Failure, UserEntity>> postSignUpUserWithFacebook() async {
  //       try {
  //       final  result = await signUpRomteDataSource.postSignUpUserWithFacebook();
  //         return Right(result);
  //      } on FirebaseAuthException catch (e) {
  //      return Left(SignUpWithEmailAndPasswordFailure.fromCode(e.code));
  //   } catch (_) {
  //    return const Left(SignUpWithEmailAndPasswordFailure());
  //   }
  // }
}
 
