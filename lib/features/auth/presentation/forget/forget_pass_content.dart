import 'package:flutter/material.dart';
import 'package:handly/features/auth/presentation/forget/forget_pass_form.dart';
import 'package:handly/generated/l10n.dart';

class ForgetPassContent extends StatelessWidget {
  const ForgetPassContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        Text(
          S.of(context).forget_pass_title,
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          S.of(context).forget_pass_sup_title,
          style: Theme.of(context).textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 32),
        ForgetPassForm(),
      ],
    );
  }
}
