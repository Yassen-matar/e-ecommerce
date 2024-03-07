import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:untitled/features/auth/sign_in/domin/use_case/post_sign_in_with_github_use_case.dart';
import 'package:untitled/features/auth/sign_in/domin/use_case/post_sign_in_with_google_use_case.dart';
import 'package:untitled/features/auth/sign_in/domin/use_case/reste_password_use_case.dart';

import '../../../../../../../core/failure/failure.dart';
import '../../../../domin/entity/user_case.dart';
import '../../../../domin/use_case/post_sign_in_use_case.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final PostSignInUseCase postSignInUseCase;
  final PostSignInWithGithubUseCase postSignInWithGithubUseCase;
  final PostSignInWithGoogleUseCase postSignInWithGoogleUseCase;
  final ResetPasswordUseCase resetPasswordUseCase;
  SignInBloc(this.postSignInUseCase, this.postSignInWithGithubUseCase,
      this.postSignInWithGoogleUseCase, this.resetPasswordUseCase)
      : super(SignInInitial()) {
    on<SignInWithEmailPassowrd>(_signInWithEmailPassword);
    on<SignInWithGoogle>(_signInWithGoogle);
    on<SignInWithGithub>(_signInWithGithub);
    on<SignInWithForgetPassword>(_signInWithForgetPassword);
  }
  Future _signInWithEmailPassword(
      SignInWithEmailPassowrd event, Emitter<SignInState> emit) async {
    emit(SignInLoding());
    final Either<Failure, UserSignInEntity> result = await postSignInUseCase
        .call(email: event.email, password: event.password);
    result.fold((failure) => emit(SignInFaliure(failure.message)),
        (user) => emit(SignInSucsses(user)));
  }

  Future _signInWithGoogle(
      SignInWithGoogle event, Emitter<SignInState> emit) async {
    emit(SignInLoding());
    final Either<Failure, UserSignInEntity> result =
        await postSignInWithGoogleUseCase.call();
    result.fold((failure) => emit(SignInFaliure(failure.message)),
        (user) => emit(SignInSuccessWithGoogle(user)));
  }

  Future _signInWithGithub(
      SignInWithGithub event, Emitter<SignInState> emit) async {
    emit(SignInLoding());
    final Either<Failure, UserSignInEntity> result =
        await postSignInWithGithubUseCase.call();
    result.fold((failure) => emit(SignInFaliure(failure.message)),
        (user) => emit(SignInSuccessWithGoogle(user)));
  }

  Future _signInWithForgetPassword(
      SignInWithForgetPassword event, Emitter<SignInState> emit) async {
    emit(SignInLoding());
    final result = await resetPasswordUseCase.call(email: event.email);
    result.fold((failure) => emit(SignInFaliure(failure.message)),
        (user) => emit(SignInWithForgetPasswordState()));
  }
}
