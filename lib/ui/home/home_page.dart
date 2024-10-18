import 'package:flutter/material.dart';
import 'package:movie_demo/core/repository/movie_repository.dart';
import 'package:movie_demo/ui/base/base_widget.dart';
import 'package:movie_demo/ui/home/components/home_view.dart';
import 'package:movie_demo/ui/home/home_viewmodel.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<HomeViewModel>(
      viewModel: HomeViewModel(movieRepository: context.read<MovieRepository>()),
      onViewModelReady: (viewModel) {
        TabController tabController = TabController(
          length: 4,
          vsync: this,
        );
        viewModel.onInit(controller: tabController);
      },
      builder: (context, viewModel, child) {
        return const HomeView();
      },
    );
  }
}
