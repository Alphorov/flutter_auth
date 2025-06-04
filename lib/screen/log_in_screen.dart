import 'dart:developer';

import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_authenticator/widget/app_text_filed.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

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
          children: [
            SizedBox(height: 180),
            AppTextFiled(hintText: "e-mail"),
            SizedBox(height: 16),
            AppTextFiled(hintText: "password"),
            SizedBox(height: 16),
            OutlinedButton(
              onPressed: () {
                log('Submit button on the LogIn Screen is pressed');
              },
              child: Text('Submit'),
            ),
            SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GoogleAuthButton(
                  onPressed: () {},
                  style: AuthButtonStyle(buttonType: AuthButtonType.icon),
                ),
                SizedBox(width: 64),
                TextButton(onPressed: () {}, child: Text('Sing Up')),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
