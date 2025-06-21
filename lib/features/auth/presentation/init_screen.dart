import 'package:flutter/material.dart';
import 'package:handly/generated/l10n.dart';

class InitScreen extends StatelessWidget {
  const InitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
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
        spacing: 16,
        children: [
          Image.asset('assets/icons/app_logo.png', scale: 4),
          Text(
            S.of(context).description,
            style: Theme.of(
              context,
            ).textTheme.headlineLarge?.copyWith(color: Colors.white),
          ),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.all(8),
              ),
              onPressed: () {
                // TODO: Navigate to login screen
              },
              child: Text(
                S.of(context).login,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.all(8),
              ),
              onPressed: () {
                // TODO: Navigate to register screen
              },
              child: Text(
                S.of(context).register,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
