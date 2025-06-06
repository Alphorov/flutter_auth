import 'package:auth_buttons/auth_buttons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_authenticator/auth/auth_controller.dart';
import 'package:flutter_authenticator/widget/app_text_filed.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  String? errorMessage;
  late bool _hasError = false;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> logIn() async {
    final String email = emailController.text.trim();
    final String password = passwordController.text.trim();

    try {
      if (email.isEmpty || password.isEmpty) {
        setState(() {
          errorMessage = 'email or password is empty';
          _hasError = true;
        });
        return;
      }

      await AuthController().signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      errorMessage = null;
      _hasError = false;
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
        _hasError = true;
      });
    }
  }

  void pushSignUp() => Navigator.of(context).pushNamed('/signup');

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('Log In', style: Theme.of(context).textTheme.headlineMedium),
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
              errorText: errorMessage,
              controller: passwordController,
              obscureText: true,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(onPressed: logIn, child: Text('Submit')),
                  SizedBox(width: 16),
                  TextButton(onPressed: pushSignUp, child: Text('Sing Up')),
                ],
              ),
            ),
            GoogleAuthButton(
              onPressed: () {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('In Progress...')));
              },
              style: AuthButtonStyle(buttonType: AuthButtonType.icon),
            ),
            Spacer(flex: 2),
          ],
        ),
      ),
    ),
  );
}
