import 'package:dartz/dartz.dart';
import 'package:untitled/core/failure/failure.dart';
import 'package:untitled/features/auth/sign_up/domin/entity/user_case.dart';
import 'package:untitled/features/auth/sign_up/domin/repos/sign_up_repo.dart';

class PostSignUpUseCase {
  final SignUpRepo signUpRepo;
  PostSignUpUseCase(this.signUpRepo); 
  
   Future<Either<Failure, UserEntity>> call(
      {required String email, required String password}) async {
    return await signUpRepo.postSignUpUser( email :email, password :password);
  } 
  
}
