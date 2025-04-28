import '../../domain/entity/auth_entity.dart';

abstract class AuthEvent {}

class SignUpEvent extends AuthEvent {
  final AuthEntity user;
  SignUpEvent(this.user);
}

class SignInEvent extends AuthEvent {
  final AuthEntity user;
  SignInEvent(this.user);
}

class VerifyEmailEvent extends AuthEvent {}