import 'package:flutter/material.dart';
import 'package:movie_demo/ui/application/components/application_body.dart';
import 'package:movie_demo/ui/application/components/application_bottom_nav_bar.dart';

class ApplicationView extends StatelessWidget {
  const ApplicationView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ApplicationBody(),
      bottomNavigationBar: ApplicationBottomNavBar(),
    );
  }
}
