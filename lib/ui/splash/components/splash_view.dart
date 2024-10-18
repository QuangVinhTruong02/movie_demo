import 'package:flutter/material.dart';
import 'package:movie_demo/gen/assets.gen.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(Assets.images.imgPopcorn.path),
      ),
    );
  }
}
