import 'package:flutter/material.dart';
import 'package:handly/features/auth/presentation/forget/forget_pass_form.dart';
import 'package:handly/generated/l10n.dart';

class ForgetPassScreen extends StatelessWidget {
  const ForgetPassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).forget_pass_title),
        centerTitle: true,
        titleTextStyle: Theme.of(context).textTheme.headlineLarge?.copyWith(
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              S.of(context).forget_pass_sup_title,
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            ForgetPassForm(),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
