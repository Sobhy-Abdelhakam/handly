import 'package:flutter/material.dart';
import 'package:handly/core/router/routers.dart';
import 'package:handly/features/auth/presentation/widget/confirm_button.dart';
import 'package:handly/generated/l10n.dart';
import 'package:handly/utils/responsive/responsive_helper.dart';

class InitScreen extends StatelessWidget {
  const InitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final maxWidth = ResponsiveHelper.getMaxWidth(context);

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/auth_bg.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: ResponsiveHelper.getPadding(context),
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: maxWidth),
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/icons/logo.png', height: 250),
                    const SizedBox(height: 16),
                    Text(
                      S.of(context).description,
                      textAlign: TextAlign.center,
                      style: Theme.of(
                        context,
                      ).textTheme.headlineLarge?.copyWith(color: Colors.white),
                    ),
                    const SizedBox(height: 32),
                    ConfirmButton(
                      text: S.of(context).login,
                      submit: () => Navigator.pushNamed(context, Routers.login),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, Routers.register);
                        },
                        child: Text(
                          S.of(context).register,
                          style: Theme.of(
                            context,
                          ).textTheme.titleLarge?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
