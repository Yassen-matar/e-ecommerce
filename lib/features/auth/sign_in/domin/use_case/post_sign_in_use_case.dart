import 'package:dartz/dartz.dart';
import 'package:untitled/core/failure/failure.dart';
import 'package:untitled/features/auth/sign_in/domin/entity/user_case.dart';
import '../repos/sign_in_repo.dart';

class PostSignInUseCase {
  final SignInRepo signInRepo;
  PostSignInUseCase(this.signInRepo); 
  
   Future<Either<Failure, UserSignInEntity>> call(
      {required String email, required String password}) async {
    return await signInRepo.postSignInUser( email :email, password :password);
  }
}
