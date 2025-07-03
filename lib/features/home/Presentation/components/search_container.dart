import 'package:flutter/material.dart';
import 'package:handly/generated/l10n.dart';

class SearchContainer extends StatelessWidget {
  const SearchContainer({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: true,
      onTap: onTap,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(12),
        hintText: S.of(context).search_hint,
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
      ),
    );
  }
}

