import 'package:flutter/material.dart';
import 'package:handly/features/home/Presentation/components/home_appbar.dart';
import 'package:handly/features/home/Presentation/components/home_categories.dart';
import 'package:handly/features/home/Presentation/components/home_products.dart';
import 'package:handly/features/home/Presentation/components/search_container.dart';
import 'package:handly/features/home/Presentation/components/section_header.dart';
import 'package:handly/utils/responsive/responsive_helper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: ResponsiveHelper.getPadding(context),
            child: Column(
              children: [
                HomeAppBar(),
                const SizedBox(height: 16),
                SearchContainer(),
                const SizedBox(height: 16),
                SectionHeader(title: 'Categories', onPressed: () {}),
                HomeCategories(),
                const SizedBox(height: 16),
                HomeProducts(),
              ],
            ),
          ),
        ),
      ),
    );

    // Scaffold(
    //   body: SafeArea(
    //     child: Center(
    //       child: Column(
    //         children: [
    //           HomeAppBar(),
    //           const SizedBox(height: 16),
    //           // SearchBar(),
    //           SearchContainer(),
    //           const SizedBox(height: 16),
    //           SectionHeader(title: 'Categories', onPressed: () {}),
    //           HomeCategories(),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
