import 'package:flutter/material.dart';
import 'package:movie_demo/ui/application/application_viewmodel.dart';
import 'package:movie_demo/ui/application/components/application_view.dart';
import 'package:movie_demo/ui/base/base_widget.dart';

class ApplicationPage extends StatelessWidget {
  const ApplicationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget<ApplicationViewModel>(
      viewModel: ApplicationViewModel(),
      builder: (context, viewModel, child) {
        return const ApplicationView();
      },
    );
  }
}
