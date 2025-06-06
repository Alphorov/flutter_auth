import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_authenticator/auth/auth_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final User? user = AuthController().currentUser;

  Future<void> signOut() async => await AuthController().signOut();

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(
        'Home Page',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(user?.email ?? 'user email is missing'),
          TextButton(onPressed: signOut, child: Text('SignOut')),
        ],
      ),
    ),
  );
}
