part of 'sign_in_bloc.dart';

class SignInEvent {
  SignInEvent();
}

class SignInWithEmailPassowrd extends SignInEvent {
  final String email;
  final String password;

  SignInWithEmailPassowrd({required this.email, required this.password});
}

class SignInWithGoogle extends SignInEvent {}

class SignInWithGithub extends SignInEvent {}
