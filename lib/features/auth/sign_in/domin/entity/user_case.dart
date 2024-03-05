
import 'package:equatable/equatable.dart';

class UserSignInEntity extends Equatable {
  final String email;
  final String name;

  const UserSignInEntity({required this.email, required this.name});

  @override
  List<Object> get props => [email, name];
}
