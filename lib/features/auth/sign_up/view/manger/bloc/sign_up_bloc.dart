import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:untitled/features/auth/sign_up/domin/use_case/post_sign_up_use_case.dart';
import 'package:untitled/features/auth/sign_up/domin/use_case/post_sign_up_with_github_use_case.dart';
import 'package:untitled/features/auth/sign_up/domin/use_case/post_sign_up_with_google_use_case.dart';

import '../../../../../../core/failure/failure.dart';
import '../../../domin/entity/user_case.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  PostSignUpWithGithub postSignUpWithGithub;
  PostSignUpUseCase postSignUpUseCase;
  PostSignUpWithGoogleUseCase postSignUpWithGoogleUseCase;
  SignUpBloc(this.postSignUpUseCase, this.postSignUpWithGoogleUseCase,
      this.postSignUpWithGithub)
      : super(SignUpInitial()) {
    on<SignUpWithEmailPassowrd>(_signUpWithEmailPassword);
    on<SignUpWithGoogle>(_signUpWithGoogle);
    on<SignUpWithGithub>(_signUpWithGithub);
  }

  Future _signUpWithEmailPassword(
      SignUpWithEmailPassowrd event, Emitter<SignUpState> emit) async {
    emit(SignUpLoding());
    final Either<Failure, UserEntity> result = await postSignUpUseCase.call(
        email: event.email, password: event.password);
    result.fold((failure) => emit(SignUpFailure(failure.message)),
        (user) => emit(SignUpSuccess(user)));
  }

  Future _signUpWithGoogle(
      SignUpWithGoogle event, Emitter<SignUpState> emit) async {
    emit(SignUpLoding());
    final Either<Failure, UserEntity> result =
        await postSignUpWithGoogleUseCase.call();
    result.fold((failure) => emit(SignUpFailure(failure.message)),
        (user) => emit(SignUpSuccessWithGoogle()));
  }

  Future _signUpWithGithub(
      SignUpWithGithub event, Emitter<SignUpState> emit) async {
    emit(SignUpLoding());
    final Either<Failure, UserEntity> result =
        await postSignUpWithGithub.call();
    result.fold((failure) => emit(SignUpFailure(failure.message)),
        (user) => emit(SignUpSuccessWithGoogle()));
  }
}
