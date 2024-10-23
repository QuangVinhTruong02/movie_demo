import 'package:flutter/material.dart';
import 'package:movie_demo/core/repository/movie_repository.dart';
import 'package:movie_demo/ui/base/base_widget.dart';
import 'package:movie_demo/ui/detail_movie/components/detail_movie_view.dart';
import 'package:movie_demo/ui/detail_movie/detail_movie_viewmodel.dart';
import 'package:provider/provider.dart';

class DetailMoviePage extends StatelessWidget {
  final int movieId;
  const DetailMoviePage({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return BaseWidget<DetailMovieViewModel>(
      viewModel: DetailMovieViewModel(
        movieId: movieId,
        movieRepository: context.read<MovieRepository>(),
      ),
      builder: (context, viewModel, child) {
        return const DetailMovieView();
      },
    );
  }
}
