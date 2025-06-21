import 'package:flutter/material.dart';
import 'package:handly/features/auth/presentation/login/login_form.dart';
import 'package:handly/generated/l10n.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
              Colors.black.withValues(alpha: 200),
              BlendMode.darken,
            ),
            image: AssetImage('assets/images/auth_bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const Spacer(),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
                color: Theme.of(context).colorScheme.surface,
              ),
              width: double.infinity,
              padding: EdgeInsets.all(32),
              child: Column(
                spacing: 8,
                children: [
                  Text(
                    S.of(context).welcome_back,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  Text(S.of(context).login),
                  const SizedBox(height: 16),
                  const LoginForm(),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(S.of(context).dont_have_account),
                      TextButton(
                        onPressed: () {
                          // TODO: Navigate to register screen
                        },
                        child: Text(S.of(context).register),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
