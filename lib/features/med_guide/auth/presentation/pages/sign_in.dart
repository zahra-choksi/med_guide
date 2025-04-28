import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_guide/core/widgets/reusable_widgets.dart';
import 'package:med_guide/features/med_guide/auth/presentation/pages/home_page.dart';
import 'package:med_guide/features/med_guide/search_medicine/presentation/widgets/appbar_widgets.dart';
import '../../domain/entity/auth_entity.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';


class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  bool _isPasswordVisible = false;


  void _onSignInPressed() {

    if (_formKey.currentState!.validate()) {
      final user = AuthEntity(
        email: _emailController.text.trim(),
        password:  _passwordController .text.trim(),
      );
      context.read<AuthBloc>().add(SignInEvent(user));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: richText(),
      backgroundColor: Colors.white,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          } else if (state is AuthVerified){
            Navigator.push(context, MaterialPageRoute(builder:(context)=> HomePage()));
          }
          if (state is AuthOTPSent) {
            showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: const Text("Verify Your Email"),
                content: const Text("A verification email has been sent. Please verify and click 'Continue'."),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text("OK"),
                  ),
                ],
              ),
            );
          }
          if (state is AuthVerified) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Signup Successful! Verify your email.')),
            );
            // You can also navigate to another page here
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),
                    const Text(
                      'Already have an Account',
                      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Please fill the form to continue',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    const SizedBox(height: 40),

                    // Email
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.pink, width: 2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Email is required';
                        }
                        if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                          return 'Enter a valid email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),

                    // Password
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.pink, width: 2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isPasswordVisible ? Icons.visibility_off : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                        ),
                      ),
                      obscureText: !_isPasswordVisible,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password is required';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),

                    // Confirm Password

                    const SizedBox(height: 40),

                    // Signup Button
                    SizedBox(
                      width: double.infinity,
                      // child: eleButton(func: (){
                      //   state is AuthLoading ? null : _onSignUpPressed;
                      // },
                      //     text: "Sign Up")),

                      child: Container(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Colors.blue, Colors.purple, Colors.pink], // Customize your colors
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                          ),
                          onPressed: state is AuthLoading ? null : _onSignInPressed,
                          child: state is AuthLoading
                              ? const CircularProgressIndicator(color: Colors.white)
                              : const Text('Sign In',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        context.read<AuthBloc>().add(VerifyEmailEvent());
                      },
                      child: const Text("Already Verified? Click to Continue"),
                    ),

                    TextButton(
                      onPressed: () async {
                        final user = FirebaseAuth.instance.currentUser;
                        if (user != null && !user.emailVerified) {
                          await user.sendEmailVerification();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Verification email resent")),
                          );
                        }
                      },
                      child: const Text("Resend Verification Email"),
                    ),

                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
