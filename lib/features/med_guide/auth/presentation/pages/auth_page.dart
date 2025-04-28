import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../init_dependency.dart';
import '../../../search_medicine/presentation/widgets/appbar_widgets.dart';
import '../../domain/entity/auth_entity.dart';
import '../../domain/repository/auth_repository.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';

class AuthPage extends StatelessWidget {
  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthBloc(getIt<AuthRepository>()),
      child: Scaffold(
        appBar: richText(),
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthOTPSent) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Verification email sent")));
            }
            if (state is AuthVerified) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Email Verified!")));
            }
            if (state is AuthError) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return Center(child: CircularProgressIndicator());
            }

            return Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  TextField(controller: emailController, decoration: InputDecoration(labelText: 'Email')),
                  TextField(controller: passController, decoration: InputDecoration(labelText: 'Password'), obscureText: true),
                  SizedBox(height: 10),
                  ElevatedButton(
                      onPressed: () {
                        final user = AuthEntity(
                          email: emailController.text.trim(),
                          password: passController.text.trim(),
                        );
                        context.read<AuthBloc>().add(SignUpEvent(user));
                      },
                      child: Text("Sign Up")),
                  ElevatedButton(
                      onPressed: () {
                        context.read<AuthBloc>().add(VerifyEmailEvent());
                      },
                      child: const Text("Check Email Verified")),
                  ElevatedButton(
                      onPressed: () {
                        final user = AuthEntity(
                          email: emailController.text.trim(),
                          password: passController.text.trim(),
                        );
                        context.read<AuthBloc>().add(SignInEvent(user));
                      },
                      child: Text("Sign In")),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
