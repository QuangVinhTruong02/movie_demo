import 'package:flutter/material.dart';
import 'package:movie_demo/core/models/movie.dart';
import 'package:movie_demo/ui/search/components/search_item_result.dart';
import 'package:movie_demo/ui/search/search_viewmodel.dart';
import 'package:provider/provider.dart';

class SearchListViewResult extends StatelessWidget {
  const SearchListViewResult({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<SearchViewmodel>();
    return StreamBuilder<bool>(
      stream: viewModel.loadMoreStream,
      builder: (context, snapshot) {
        bool isLoadMore = snapshot.data ?? false;
        List<Movie> movieList = viewModel.movieList;
        return ListView.separated(
          controller: viewModel.scrollController,
          padding: const EdgeInsets.only(right: 24, left: 24, bottom: 16),
          shrinkWrap: true,
          itemCount: movieList.length + (isLoadMore ? 1 : 0),
          separatorBuilder: (context, index) => const SizedBox(height: 24),
          itemBuilder: (context, index) {
            if (index < movieList.length) {
              Movie movie = movieList[index];
              return SearchItemResult(movie: movie);
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        );
      },
    );
  }
}
