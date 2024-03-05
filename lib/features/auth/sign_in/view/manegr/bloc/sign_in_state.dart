part of 'sign_in_bloc.dart';

class SignInState {}

class SignInInitial extends SignInState {}

class SignInLoding extends SignInState {}

class SignInSucsses extends SignInState {
  final UserSignInEntity user;
  SignInSucsses(this.user);
}

class SignInFaliure extends SignInState {
  final String errorMessage;
  SignInFaliure(this.errorMessage);
}

class SignInSuccessWithGoogle extends SignInState { 
    final UserSignInEntity user;
  SignInSuccessWithGoogle(this.user);
}
class SignInWithForgetPasswordState extends SignInState{} 
