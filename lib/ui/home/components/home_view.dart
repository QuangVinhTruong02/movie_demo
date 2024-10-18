import 'package:flutter/material.dart';
import 'package:movie_demo/ui/home/components/home_app_bar.dart';
import 'package:movie_demo/ui/home/components/home_carousel.dart';
import 'package:movie_demo/ui/home/components/home_grid_view.dart';
import 'package:movie_demo/ui/home/components/home_movie_tab.dart';
import 'package:movie_demo/ui/home/home_viewmodel.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<HomeViewModel>();
    return Scaffold(
      appBar: const HomeAppBar(),
      body: SingleChildScrollView(
        controller: viewModel.scrollController,
        padding: const EdgeInsets.only(top: 20),
        child: const Column(
          children: [
            HomeCarousel(),
            SizedBox(height: 10),
            HomeMovieTab(),
            SizedBox(height: 24),
            HomeGridView(),
          ],
        ),
      ),
    );
  }
}
