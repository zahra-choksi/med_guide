import 'package:firebase_auth/firebase_auth.dart';

import '../domain/entity/auth_entity.dart';
import '../domain/repository/auth_repository.dart';


class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<void> signUp(AuthEntity user) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
      email: user.email,
      password: user.password,
    );
    await sendEmailVerification();
  }

  @override
  Future<void> sendEmailVerification() async {
    final user = _firebaseAuth.currentUser;
    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
    }
  }

  @override
  Future<void> signIn(AuthEntity user) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: user.email,
      password: user.password,
    );
  }

  @override
  Future<bool> isEmailVerified() async {
    final user = _firebaseAuth.currentUser;
    await user?.reload();
    return user?.emailVerified ?? false;
  }
}
