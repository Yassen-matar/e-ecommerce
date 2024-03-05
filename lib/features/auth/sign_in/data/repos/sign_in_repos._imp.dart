// ignore_for_file: avoid_print

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled/features/auth/sign_in/data/data_source/sign_in_remote_data_source.dart';
import '../../../../../core/failure/failure.dart';
import '../../domin/entity/user_case.dart';
import '../../domin/repos/sign_in_repo.dart';


class SignInRepoImpl extends SignInRepo {
  SignInRomteDataSource signInRomteDataSource;
  SignInRepoImpl(this.signInRomteDataSource); 

  @override
Future<Either<Failure, UserSignInEntity>>postSignInUser ( {required String email, required String password}) async {
    try {
        final result = await signInRomteDataSource.postSignUpUser(email : email, password : password,);
          return Right(result);
       } on FirebaseAuthException catch (e) {
       return Left(LogInWithEmailAndPasswordFailure.fromCode(e.code));
    } catch (_) {
     return const Left(LogInWithEmailAndPasswordFailure());
    }
  }
  
  @override
  Future<Either<Failure, UserSignInEntity>> postSignUpUserWithGithub() async{
     try {
        final result = await signInRomteDataSource.postSignInUserWithGithub();
          return Right(result);
       } on FirebaseAuthException catch (e) {
       return Left(LogInWithEmailAndPasswordFailure.fromCode(e.code));
    } catch (_) {
     return const Left(LogInWithEmailAndPasswordFailure());
    }
  }
  
  @override
  Future<Either<Failure, UserSignInEntity>> postSignUpUserWithGoogle() async {
     try {
        final result = await signInRomteDataSource.postSignInUserWithGoogle();
          return Right(result);
       } on FirebaseAuthException catch (e) {
       return Left(LogInWithGoogleFailure.fromCode(e.code));
    } catch (_) {
     return const Left(LogInWithGoogleFailure());
    }
  }

 
}
 
