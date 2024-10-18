import 'package:flutter/material.dart';
import 'package:movie_demo/ui/application/application_viewmodel.dart';
import 'package:movie_demo/ui/home/home_page.dart';
import 'package:provider/provider.dart';

class ApplicationBody extends StatelessWidget {
  const ApplicationBody({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<ApplicationViewModel>();
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: viewModel.pageController,
      children: const [
        HomePage(),
        Center(
          child: Text("search"),
        ),
        Center(
          child: Text("watch list"),
        ),
      ],
    );
  }
}
