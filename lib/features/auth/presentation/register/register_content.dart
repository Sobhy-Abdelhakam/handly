import 'package:flutter/material.dart';
import 'package:handly/core/router/routers.dart';
import 'package:handly/features/auth/presentation/register/register_form.dart';
import 'package:handly/generated/l10n.dart';
import 'package:handly/utils/responsive/responsive_helper.dart';

class RegisterContent extends StatelessWidget {
  const RegisterContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: ResponsiveHelper.getPadding(context),
      child: Column(
        spacing: 8,
        children: [
          Text(
            S.of(context).register,
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          RegisterForm(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(S.of(context).already_have_account),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, Routers.login);
                },
                child: Text(S.of(context).login),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
