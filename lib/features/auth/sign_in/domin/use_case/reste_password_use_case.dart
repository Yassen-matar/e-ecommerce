import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:untitled/core/failure/failure.dart';
import 'package:untitled/features/auth/sign_in/domin/entity/user_case.dart';
import '../repos/sign_in_repo.dart';

class ResetPasswordUseCase {
  final SignInRepo signInRepo;
  ResetPasswordUseCase(this.signInRepo);

  Future<Either<Failure, UserSignInEntity>>call({required String email}) async {
    return await signInRepo.resetPassword(email:email );
  }
}
