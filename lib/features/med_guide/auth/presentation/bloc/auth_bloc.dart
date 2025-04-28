import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/repository/auth_repository.dart';
import 'auth_event.dart';
import 'auth_state.dart';


class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository;

  AuthBloc(this.repository) : super(AuthInitial()) {
    on<SignUpEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        await repository.signUp(event.user);
        emit(AuthOTPSent());
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    });

    on<VerifyEmailEvent>((event, emit) async {
      emit(AuthLoading());
      bool verified = await repository.isEmailVerified();
      if (verified) {
        emit(AuthVerified());
      } else {
        emit(AuthError("Email not verified yet"));
      }
    });

    on<SignInEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        await repository.signIn(event.user);
        bool verified = await repository.isEmailVerified();
        if (verified) {
          emit(AuthVerified());
        } else {
          emit(AuthError("Email not verified"));
        }
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    });
  }
}