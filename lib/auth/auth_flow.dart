import 'package:flutter/material.dart';
import 'package:flutter_authenticator/screen/log_in_screen.dart';
import 'package:flutter_authenticator/screen/sign_up_screen.dart';

class AuthFlow extends StatelessWidget {
  const AuthFlow({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/signup':
            return MaterialPageRoute(builder: (_) => const SignUpScreen());
          default:
            return MaterialPageRoute(builder: (_) => const LogInScreen());
        }
      },
    );
  }
}
