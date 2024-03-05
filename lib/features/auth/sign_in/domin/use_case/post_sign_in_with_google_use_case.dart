import 'package:dartz/dartz.dart';
import 'package:untitled/core/failure/failure.dart';
import 'package:untitled/features/auth/sign_in/domin/entity/user_case.dart';
import '../repos/sign_in_repo.dart';

class PostSignInWithGoogleUseCase{
  final SignInRepo signInRepo;
  PostSignInWithGoogleUseCase(this.signInRepo);

  Future<Either<Failure, UserSignInEntity>> call() async {
    return await signInRepo.postSignUpUserWithGoogle();
  }
}
