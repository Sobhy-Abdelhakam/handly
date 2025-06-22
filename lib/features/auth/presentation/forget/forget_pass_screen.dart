import 'package:flutter/material.dart';
import 'package:handly/features/auth/presentation/forget/forget_pass_content.dart';
import 'package:handly/utils/responsive/responsive_helper.dart';

class ForgetPassScreen extends StatelessWidget {
  const ForgetPassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveHelper.isDesktop(context);
    final isTablet = ResponsiveHelper.isTablet(context);
    final maxFormWidth =
        isDesktop
            ? 500.0
            : isTablet
            ? 450.0
            : double.infinity;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: maxFormWidth),
            child: ForgetPassContent(),
          ),
        ),
      ),
    );
  }
}
