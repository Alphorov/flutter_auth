import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_authenticator/auth/auth_controller.dart';
import 'package:flutter_authenticator/widget/app_text_filed.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String? _errorText;
  bool _hasError = false;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController repeatPasswordController =
      TextEditingController();

  Future<void> signUp() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final repeatPassword = repeatPasswordController.text.trim();

    if (email.isEmpty || password.isEmpty || repeatPassword.isEmpty) {
      setState(() {
        _errorText = 'all fields must be filled in';
        _hasError = true;
      });

      return;
    }

    if (password != repeatPassword) {
      setState(() {
        _errorText = 'passwords are not identical';
        _hasError = true;
      });

      return;
    }

    try {
      await AuthController().createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        _errorText = e.message;
        _hasError = true;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    repeatPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('Sign Up', style: Theme.of(context).textTheme.headlineMedium),
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
    ),
    body: Padding(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            AppTextFiled(
              hintText: "e-mail",
              hasError: _hasError,
              controller: emailController,
            ),
            SizedBox(height: 8),
            AppTextFiled(
              hintText: "password",
              hasError: _hasError,
              controller: passwordController,
            ),
            SizedBox(height: 8),
            AppTextFiled(
              hintText: "repeat password",
              errorText: _errorText,
              controller: repeatPasswordController,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: OutlinedButton(onPressed: signUp, child: Text('Submit')),
            ),
            Spacer(flex: 2),
          ],
        ),
      ),
    ),
  );
}
