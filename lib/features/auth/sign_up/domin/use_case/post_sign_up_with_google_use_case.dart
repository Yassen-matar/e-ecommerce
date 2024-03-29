import 'package:dartz/dartz.dart';
import 'package:untitled/core/failure/failure.dart';
import 'package:untitled/features/auth/sign_up/domin/entity/user_case.dart';
import 'package:untitled/features/auth/sign_up/domin/repos/sign_up_repo.dart';

class PostSignUpWithGoogleUseCase {
  final SignUpRepo signUpRepo;
  PostSignUpWithGoogleUseCase(this.signUpRepo); 
  
   Future<Either<Failure, UserEntity>> call(
      ) async {
    return await signUpRepo.postSignUpUserWithGoogle();
  } 
  
}
