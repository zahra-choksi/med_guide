import '../entity/auth_entity.dart';

abstract class AuthRepository {
  Future<void> signUp(AuthEntity user);
  Future<void> sendEmailVerification();
  Future<void> signIn(AuthEntity user);
  Future<bool> isEmailVerified();
}
