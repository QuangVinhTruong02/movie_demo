import 'package:flutter/material.dart';
import 'package:movie_demo/helper/routers.dart';
import 'package:movie_demo/ui/base/base_viewmodel.dart';

class SplashViewmodel extends BaseViewModel {
  Future<void> onInit() async {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        Navigator.pushReplacementNamed(context, Routers.application);
      },
    );
  }
}
