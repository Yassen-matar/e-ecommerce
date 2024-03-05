part of 'sign_up_bloc.dart';

class SignUpEvent {
  SignUpEvent();
}

class SignUpWithEmailPassowrd extends SignUpEvent {
  final String email;
  final String password;
  SignUpWithEmailPassowrd({required this.email, required this.password});
}

class SignUpWithGoogle extends SignUpEvent {
  SignUpWithGoogle();
}

class SignUpWithGithub extends SignUpEvent {
  SignUpWithGithub();
}
