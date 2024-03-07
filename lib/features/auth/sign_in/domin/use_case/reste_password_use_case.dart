import 'package:dartz/dartz.dart';

import 'package:untitled/core/failure/failure.dart';
import '../repos/sign_in_repo.dart';

class ResetPasswordUseCase {
  final SignInRepo signInRepo;
  ResetPasswordUseCase(this.signInRepo);

  Future<Either<Failure, String>>call({required String email}) async {
    return await signInRepo.resetPassword(email:email );
  }
}
