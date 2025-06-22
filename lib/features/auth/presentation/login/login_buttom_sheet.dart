import 'package:flutter/material.dart';
import 'package:handly/features/auth/presentation/login/login_content.dart';
import 'package:handly/utils/responsive/responsive_helper.dart';

class LoginButtomSheet extends StatelessWidget {
  const LoginButtomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
          color: Theme.of(context).colorScheme.surface,
        ),
        padding: ResponsiveHelper.getPadding(context),
        child: LoginContent(),
      ),
    );
  }
}
