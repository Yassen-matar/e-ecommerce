import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

/// log_in_with_email_and_password_failure
/// Thrown during the login process if a failure occurs.
class LogInWithEmailAndPasswordFailure extends Failure implements Exception {
  const LogInWithEmailAndPasswordFailure([
    super.message = 'An unknown exception occurred.',
  ]);

  /// Create an authentication message
  /// from a firebase authentication exception code.
  factory LogInWithEmailAndPasswordFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const LogInWithEmailAndPasswordFailure(
          'Email is not valid or badly formatted.',
        );
      case 'user-disabled':
        return const LogInWithEmailAndPasswordFailure(
          'This user has been disabled. Please contact support for help.',
        );
      case 'user-not-found':
        return const LogInWithEmailAndPasswordFailure(
          'Email is not found, please create an account.',
        );
      case 'wrong-password':
        return const LogInWithEmailAndPasswordFailure(
          'Incorrect password, please try again.',
        );
      default:
        return const LogInWithEmailAndPasswordFailure();
    }
  }
}

///  sign_up_with_email_and_password_failure
/// Thrown if during the sign up process if a failure occurs.
class SignUpWithEmailAndPasswordFailure extends Failure implements Exception {
  const SignUpWithEmailAndPasswordFailure([
    super.message = 'An unknown exception occurred.',
  ]);

  /// Create an authentication message
  /// from a firebase authentication exception code.
  factory SignUpWithEmailAndPasswordFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const SignUpWithEmailAndPasswordFailure(
          'Email is not valid or badly formatted.',
        );
      case 'user-disabled':
        return const SignUpWithEmailAndPasswordFailure(
          'This user has been disabled. Please contact support for help.',
        );
      case 'email-already-in-use':
        return const SignUpWithEmailAndPasswordFailure(
          'An account already exists for that email.',
        );
      case 'operation-not-allowed':
        return const SignUpWithEmailAndPasswordFailure(
          'Operation is not allowed.  Please contact support.',
        );
      case 'weak-password':
        return const SignUpWithEmailAndPasswordFailure(
          'Please enter a stronger password.',
        );
      default:
        return const SignUpWithEmailAndPasswordFailure();
    }
  }
}

/// Thrown during the sign in with google process if a failure occurs.
class LogInWithGoogleFailure extends Failure implements Exception {
  const LogInWithGoogleFailure([
    super.message = 'An unknown exception occurred.',
  ]);

  /// Create an authentication message
  /// from a firebase authentication exception code.
  factory LogInWithGoogleFailure.fromCode(String code) {
    switch (code) {
      case 'account-exists-with-different-credential':
        return const LogInWithGoogleFailure(
          'Account exists with different credentials.',
        );
      case 'email is empty':
        return const LogInWithGoogleFailure(
          'email is empty',
        );
      case 'invalid-credential':
        return const LogInWithGoogleFailure(
          'The credential received is malformed or has expired.',
        );
      case 'operation-not-allowed':
        return const LogInWithGoogleFailure(
          'Operation is not allowed.  Please contact support.',
        );
      case 'user-disabled':
        return const LogInWithGoogleFailure(
          'This user has been disabled. Please contact support for help.',
        );
      case 'user-not-found':
        return const LogInWithGoogleFailure(
          'Email is not found, please create an account.',
        );
      case 'wrong-password':
        return const LogInWithGoogleFailure(
          'Incorrect password, please try again.',
        );
      case 'invalid-verification-code':
        return const LogInWithGoogleFailure(
          'The credential verification code received is invalid.',
        );
      case 'invalid-verification-id':
        return const LogInWithGoogleFailure(
          'The credential verification ID received is invalid.',
        );
      default:
        return const LogInWithGoogleFailure();
    }
  }
}

/// Thrown during the sign in with google process if a failure occurs.
class ForgetPasswordFailure extends Failure implements Exception {
  const ForgetPasswordFailure([
    super.message = 'An unknown exception occurred.',
  ]);

  /// Create an authentication message
  /// from a firebase authentication exception code.
  factory ForgetPasswordFailure.fromCode(String code) {
    switch (code) {
      case 'account-exists-with-different-credential':
        return const ForgetPasswordFailure(
          'Account exists with different credentials.',
        );
      case 'email is empty':
        return const ForgetPasswordFailure(
          'email is empty',
        );
      case 'invalid-credential':
        return const ForgetPasswordFailure(
          'The credential received is malformed or has expired.',
        );
      case 'operation-not-allowed':
        return const ForgetPasswordFailure(
          'Operation is not allowed.  Please contact support.',
        );
      case 'user-disabled':
        return const ForgetPasswordFailure(
          'This user has been disabled. Please contact support for help.',
        );
      case 'user-not-found':
        return const ForgetPasswordFailure(
          'Email is not found, please create an account.',
        );

      default:
        return const ForgetPasswordFailure();
    }
  }
}

/// Thrown during the sign in with google process if a failure occurs.
class AnyFailure extends Failure implements Exception {
  const AnyFailure([
    super.message = 'An unknown exception occurred.',
  ]);
}
