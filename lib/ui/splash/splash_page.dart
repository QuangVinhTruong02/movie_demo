import 'package:flutter/material.dart';
import 'package:movie_demo/ui/base/base_widget.dart';
import 'package:movie_demo/ui/splash/components/splash_view.dart';
import 'package:movie_demo/ui/splash/splash_viewmodel.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget<SplashViewmodel>(
      viewModel: SplashViewmodel(),
      onViewModelReady: (viewModel) => viewModel.onInit(),
      builder: (context, viewModel, child) {
        return const SplashView();
      },
    );
  }
}
