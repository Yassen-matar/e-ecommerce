part of 'sign_up_bloc.dart';

class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpLoding extends SignUpState {}

class SignUpSuccess extends SignUpState {
  final UserEntity user;
  SignUpSuccess(this.user);
}

class SignUpFailure extends SignUpState {
  final String errMessage;

  SignUpFailure(this.errMessage);
}

class SignUpSuccessWithGoogle extends SignUpState {}
