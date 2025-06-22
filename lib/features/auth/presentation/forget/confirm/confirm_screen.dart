import 'package:flutter/material.dart';
import 'package:handly/core/router/routers.dart';
import 'package:handly/features/auth/presentation/widget/confirm_button.dart';
import 'package:handly/generated/l10n.dart';
import 'package:handly/utils/responsive/responsive_helper.dart';

class ConfirmScreen extends StatelessWidget {
  const ConfirmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final screenWidth = ResponsiveHelper.screenWidth(context);

    final isDesktop = ResponsiveHelper.isDesktop(context);
    final isTablet = ResponsiveHelper.isTablet(context);
    final maxWidth =
        isDesktop
            ? 500.0
            : isTablet
            ? 450.0
            : double.infinity;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: ResponsiveHelper.getPadding(context),
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: maxWidth),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 16,
                children: [
                  Image(
                    image: AssetImage('assets/images/send_email.png'),
                    width: isMobile ? screenWidth * 0.7 : 300,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    S.of(context).confirm_screen_title,
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    S.of(context).confirm_screen_sub_title,
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  ConfirmButton(
                    text: S.of(context).done,
                    submit: () {
                      Navigator.popUntil(
                        context,
                        ModalRoute.withName(Routers.login),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
