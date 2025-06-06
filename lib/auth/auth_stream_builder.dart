import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_authenticator/auth/auth_controller.dart';
import 'package:flutter_authenticator/screen/home_screen.dart';
import 'package:flutter_authenticator/auth/auth_flow.dart';

class AuthStreamBuilder extends StatelessWidget {
  AuthStreamBuilder({super.key});

  final authStateChanges = AuthController().authStateChanges;

  Widget _home(BuildContext context, AsyncSnapshot<User?> snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    if (snapshot.hasData) {
      return HomeScreen();
    } else {
      return AuthFlow();
    }
  }

  @override
  Widget build(BuildContext context) =>
      StreamBuilder(stream: authStateChanges, builder: _home);
}
