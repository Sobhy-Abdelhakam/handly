import 'package:flutter/material.dart';
import 'package:handly/features/auth/presentation/register/register_form.dart';
import 'package:handly/generated/l10n.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).register),
        centerTitle: true,
        titleTextStyle: Theme.of(context).textTheme.displaySmall?.copyWith(
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Padding(padding: const EdgeInsets.all(16.0), child: RegisterForm()),
    );
  }
}
