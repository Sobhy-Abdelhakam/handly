import 'package:flutter/material.dart';
import 'package:handly/features/auth/presentation/forget/forget_pass_content.dart';
import 'package:handly/utils/responsive/responsive_helper.dart';

class ForgetPassScreen extends StatelessWidget {
  const ForgetPassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final maxFormWidth = ResponsiveHelper.getMaxWidth(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: ResponsiveHelper.getPadding(context),
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: maxFormWidth),
              child: ForgetPassContent(),
            ),
          ),
        ),
      ),
    );
  }
}
