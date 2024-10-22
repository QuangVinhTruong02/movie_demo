import 'package:flutter/material.dart';
import 'package:movie_demo/core/repository/movie_repository.dart';
import 'package:movie_demo/ui/base/base_widget.dart';
import 'package:movie_demo/ui/search/components/search_view.dart';
import 'package:movie_demo/ui/search/search_viewmodel.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget<SearchViewmodel>(
      viewModel: SearchViewmodel(movieRepository: context.read<MovieRepository>()),
      onViewModelReady: (viewModel) => viewModel.onInit(),
      builder: (context, viewModel, child) {
        return const SearchView();
      },
    );
  }
}
