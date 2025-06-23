import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:handly/features/auth/presentation/login/login_content.dart';
import 'package:handly/utils/responsive/responsive_helper.dart';

class LoginCard extends StatelessWidget {
  const LoginCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(25)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            width: ResponsiveHelper.mobileBreakpoint,
            decoration: BoxDecoration(
              color: Colors.grey.withValues(alpha: 0.1),
              borderRadius: BorderRadius.all(Radius.circular(25)),
            ),
            child: LoginContent(),
          ),
        ),
      ),
    );
  }
}
