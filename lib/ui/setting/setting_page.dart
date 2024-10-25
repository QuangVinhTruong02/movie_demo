import 'package:flutter/material.dart';
import 'package:movie_demo/ui/base/base_widget.dart';
import 'package:movie_demo/ui/setting/components/setting_view.dart';
import 'package:movie_demo/ui/setting/setting_viewmodel.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget<SettingViewModel>(
      viewModel: SettingViewModel(),
      onViewModelReady: (viewModel) => viewModel.onInit(),
      builder: (context, viewModel, child) {
        return const SettingView();
      },
    );
  }
}
